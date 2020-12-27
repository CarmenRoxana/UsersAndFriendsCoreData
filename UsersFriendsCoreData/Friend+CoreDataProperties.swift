//
//  Friend+CoreDataProperties.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/26/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: User?
    
    var wrappedID: String { id ?? "" }
    var wrappedName: String { name ?? "" }

}
