//
//  UserView.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/23/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//

import SwiftUI

struct UserView: View {
    let user: User

    var body: some View {
        List {
            Section(header: Text("Name")) {
                Text(user.wrappedName)
            }
            Section(header: Text("Age")) {
                Text(String(user.age))
            }
            Section(header: Text("Company")) {
                Text(user.wrappedCompany)
            }
            Section(header: Text("Email")) {
                Text(user.wrappedEmail)
            }
            Section(header: Text("Address")) {
                Text(user.wrappedAddress)
            }
            Section(header: Text("Friends").font(.headline)) {
                NavigationLink(destination: FriendView(friends: user.wrappedFriends)) {
                    Text("\(user.wrappedName) has \(user.wrappedFriends.count) friends")
                }
            }
        }
        .navigationBarTitle("\(user.wrappedName)", displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User())
    }
}
