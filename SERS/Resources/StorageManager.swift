//
//  StorageManager.swift
//  SERS
//
//  Created by Noah Nemec on 10/3/21.
//

import Foundation
import FirebaseStorage


final class StorageManager {
	
	static let shared = StorageManager()
	
	private let storage = Storage.storage().reference()
	
//	/images/noah-gmail-com_profile_picture.png
	
	public typealias UploadPictureCmpletion = (Result<String,Error>) -> Void
/// Uploads pic to firebase and returns completion with url strign to download
	
	public func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping UploadPictureCmpletion) {
		storage.child("images/\(fileName)").putData(data, metadata: nil, completion: {metadata, error in
			guard error == nil else {
//				failed
				print("failed to opload data to firebase for picture")
				
				completion(.failure(StorageErrors.failedToUpload))
				return
			}
			
			self.storage.child("images/\(fileName)").downloadURL(completion: { url, error in
				guard let url = url else {
					print("Failed to get download url")
					completion(.failure(StorageErrors.failedToGetDownUrl))
					return
				}
				
				let urlString = url.absoluteString
				print("download url returned: \(urlString)")
				completion(.success(urlString))
			})
		})
	}
	public enum StorageErrors: Error {
		case failedToUpload
		case failedToGetDownUrl
	}
}
