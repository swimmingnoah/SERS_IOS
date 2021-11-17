////
////  ChatViewController.swift
////  SERS
////
////  Created by Noah Nemec on 10/2/21.
////
//
//import UIKit
//import MessageKit
//
//
//struct Message: MessageType {
//	var sender: SenderType
//
//	var messageId: String
//
//	var sentDate: Date
//
//	var kind: MessageKind
//}
//
//
//struct Sender: SenderType {
//	var photoURL: String
//	var senderId: String
//	var displayName: String
//}
//
//class ChatViewController: MessagesViewController {
//
//	private var messages = [Message]()
//
//	private let selfSender = Sender(photoURL: "",
//									senderId: "1",
//									displayName: "MUPD")
//    private let personSender = Sender(photoURL: "",
//                                    senderId: "2",
//                                    displayName: "Joe Smith")
//
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		messages.append(Message(sender: personSender,
//								messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Hello this is MUPD what is your emergency?")))
//
//        messages.append(Message(sender: selfSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Their is a school shooter in my classroom!")))
//        messages.append(Message(sender: personSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Our records show that you are currently in Middlebush Hall is that correct?")))
//        messages.append(Message(sender: selfSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("yes")))
//        messages.append(Message(sender: personSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Alright! the authorities are on their way and will be ariving in 3 min")))
//
//
//
//		messagesCollectionView.messagesDataSource = self
//		messagesCollectionView.messagesLayoutDelegate = self
//		messagesCollectionView.messagesDisplayDelegate = self
//
//        UIGraphicsBeginImageContext(self.view.frame.size)
//        UIImage(named: "Backdrop")?.draw(in: self.view.bounds)
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        self.view.backgroundColor = UIColor(patternImage: image)
//	}
//
//
//
//}
//
//extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
//	func currentSender() -> SenderType {
//		return selfSender
//	}
//
//	func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
//		return messages[indexPath.section]
//	}
//
//	func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//		return messages.count
//	}
//
//
//}
