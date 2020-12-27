//
//  FriendView.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/23/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//

import SwiftUI
import CoreData

struct FriendView: View {
@Environment(\.managedObjectContext) var moc
    
    let friends: [Friend]
    
    func getFriend(friend: Friend) -> User {
        let request: NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", friend.wrappedID)
        
        guard let users = try? moc.fetch(request) else {
            return User()
        }
        
        return users.first ?? User()
    }
    
    var body: some View {
        List(friends, id: \.wrappedID) { friend in
            NavigationLink(destination: UserView(user: self.getFriend(friend: friend))) {
                VStack(alignment: .leading) {
                    Text(friend.wrappedName)
                        .font(.headline)
                }
            }
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friends: [])
    }
}


