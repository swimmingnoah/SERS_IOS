//
//  ChatUser.swift
//  SERS
//
//  Created by Noah Nemec on 11/16/21.
//

import Foundation
import MessageKit

struct ChatUser: SenderType, Equatable {
    var senderId: String
    var displayName: String
}
