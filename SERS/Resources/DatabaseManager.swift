////
////  DatabaseManager.swift
////  SERS
////
////  Created by Noah Nemec on 9/30/21.
////
//
//import Foundation
//import FirebaseDatabase
//
//
//final class DatabaseManager {
//	
//	static let shared = DatabaseManager()
//	
//	private let database = Database.database().reference()
//	
//	static func safeEmail(emailAddress: String) -> String {
//		var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
//		safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
//		return safeEmail
//	}
//
//	
//}
//
//// MARK: Account Manager
//extension DatabaseManager {
//	
//	public func userExists(with email: String,
//						   completion: @escaping ((Bool) -> Void)) {
//		
//		
//		var safeEmail = email.replacingOccurrences(of: ".", with: "-")
//		safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
//		
//		database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
//			guard snapshot.value as? String != nil else {
//				completion(false)
//				return
//			}
//			completion(true)
//		})
//	}
//	
//	/// insert new user to database
//	public func insertUser(with user: ChatAppUser, completion: @escaping (Bool) -> Void) {
//		database.child(user.safeEmail).setValue([
//			"first_name": user.firstName,
//			"last_name": user.lastName
//			
//		], withCompletionBlock: {error, _ in
//			guard error == nil else {
//				print("failed to write to database")
//				completion(false)
//				return
//			}
//			
//			
//			self.database.child("users").observeSingleEvent(of: .value, with: { snapshot in
//				if var usersCollection = snapshot.value as? [[String: String]] {
//					//					append to user dict
//					let newElement = [
//						"name": user.firstName + " " + user.lastName,
//						"email": user.safeEmail
//					]
//					usersCollection.append(newElement)
//					
//					self.database.child("users").setValue(usersCollection, withCompletionBlock:  { error, _ in
//						guard error == nil else {
//							completion(false)
//							return
//						}
//						
//						completion(true)
//					})
//					
//				}
//				else {
////					create array
//					let newCollection: [[String: String]] = [
//						[
//							"name": user.firstName + " " + user.lastName,
//							"email": user.safeEmail
//						]
//					]
//					self.database.child("users").setValue(newCollection, withCompletionBlock:  { error, _ in
//						guard error == nil else {
//							completion(false)
//							return
//						}
//						
//						completion(true)
//					})
//				}
//			})
//		})
//	}
//}
//
//// sending messages/ convos
//extension DatabaseManager {
////	creates new convo with email and first message sent
//	public func createNewConversation(with otherUserEmail: String, firstMessage: Message, completion: @escaping (Bool) -> Void) {
//		
//	}
//	
////	fetches and returns all convos for user with passed in email
//	public func getAllConversations(for email: String, completion: @escaping (Result<String, Error>) -> Void) {
//		
//	}
////	gets all messages for given convos
//	public func getAllMessagesForConversation(with id: String, completion: @escaping (Result<String, Error>) -> Void) {
//		
//	}
////	sends message with target convo and message
//	public func sendMessage(to conversation: String, message: Message, completion: (Bool) -> Void) {
//		
//	}
//}
//
//
//
//
//
//
//
//
//struct ChatAppUser {
//	let firstName: String
//	let lastName: String
//	let emailAddress: String
//	
//	var safeEmail: String {
//		var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
//		safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
//		return safeEmail
//	}
//	var profilePictureFineName: String {
////		noah-gmail-com_profile_picture.png
//		return "\(safeEmail)_profile_picture.png"
//	}
//}
