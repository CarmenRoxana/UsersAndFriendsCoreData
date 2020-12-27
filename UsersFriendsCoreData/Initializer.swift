//
//  Initializer.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/23/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


class Initializer: ObservableObject {
//   let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // handle the result here.
            if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode([UserStruct].self, from: data), let users: [User] = try? self.moc.fetch(User.fetchRequest()) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        for dUser in decodedResponse {
                            if users.first(where: { $0.id == dUser.id }) != nil {
                                continue
                            }
                            
                            let user = User(context: self.moc)
                            user.id = dUser.id
                            user.isActive = dUser.isActive
                            user.name = dUser.name
                            user.age = Int16(dUser.age)
                            user.company = dUser.company
                            user.email = dUser.email
                            user.address = dUser.address
                            user.about = dUser.about
                            user.registered = dUser.registered
                            user.tags = dUser.tags
                            
                            
                            for dFriend in dUser.friends {
                                let friend = Friend(context: self.moc)
                                friend.id = dFriend.id
                                friend.name = dFriend.name
                                user.addToFriends(friend)
                            }
                        }
                        
                        if self.moc.hasChanges {
                            try? self.moc.save()
                        }
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

