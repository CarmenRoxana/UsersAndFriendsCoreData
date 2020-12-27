//
//  UserStruct.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/23/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//

import Foundation

struct UserStruct: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [FriendStruct]
}
