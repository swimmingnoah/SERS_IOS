//
//  ChatViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/2/21.
//

import UIKit
import MessageKit
import InputBarAccessoryView


struct Message: MessageType {
	var sender: SenderType
	
	var messageId: String
	
	var sentDate: Date
	
	var kind: MessageKind
}


struct Sender: SenderType {
	var photoURL: String
	var senderId: String
	var displayName: String
}

class ChatViewController: MessagesViewController {
	
	public static let dateFormatter: DateFormatter = {
		let formattre = DateFormatter()
		formattre.dateStyle = .medium
		formattre.timeStyle = .long
		formattre.locale = .current
		return formattre
	}()
	
	public let otherUserEmail: String
	public var isNewConversation = false
	
	private var messages = [Message]()
	
	private var selfSender: Sender? {
		guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
			return nil
		}
				return Sender(photoURL: "",
					   senderId: email,
					   displayName: "Joe Smith")
	}
	init(with email:String) {
		self.otherUserEmail = email
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		messagesCollectionView.messagesDataSource = self
		messagesCollectionView.messagesLayoutDelegate = self
		messagesCollectionView.messagesDisplayDelegate = self
		messageInputBar.delegate = self
//		messageInputBar.inputTextView.isFirstResponder
    }
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		messageInputBar.inputTextView.becomeFirstResponder()
	}
    


}
extension ChatViewController: InputBarAccessoryViewDelegate {
	func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
		guard !text.replacingOccurrences(of: " ", with: "").isEmpty,
		let selfSender = self.selfSender,
		let messageId = createMessageId() else{
			
			return
		}
		print("sending: \(text)")
//		send message
		if isNewConversation {
//			create convo
			let mmessage = Message(sender: selfSender,
								  messageId: messageId,
								  sentDate: Date(),
								  kind: .text(text))
			DatabaseManager.shared.createNewConversation(with: otherUserEmail, firstMessage: mmessage, completion: { success in
				if success {
					print("message sent")
				}
				else {
					print("failed to send")
				}
			})
		}
		else {
//			append to existing
		}
		
	}
	
	private func createMessageId() -> String? {
		//		date, other user email, sender email, ramdom int
		
		guard let currentUserEmail = UserDefaults.standard.value(forKey: "email") else {
				  return nil
			  }
		let dateString = Self.dateFormatter.string(from: Date())
		let newIdentifier = "\(otherUserEmail)_\(currentUserEmail)_\(dateString)"
		print("created message id \(newIdentifier)")
		return newIdentifier
	}
}
  
extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
	func currentSender() -> SenderType {
		if let sender = selfSender {
			return sender
		}
		fatalError("Self sender is nil, email should be cached")
		return Sender(photoURL: "", senderId: "12", displayName: "")
	}
	
	func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
		return messages[indexPath.section]
	}
	
	func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
		return messages.count
	}
	

}
