//
//  ContentView.swift
//  UsersFriendsCoreData
//
//  Created by Carmen Kakarash on 12/23/20.
//  Copyright © 2020 CarmenK. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)]) var users: FetchedResults<User>
    @ObservedObject var initializer = Initializer()


    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    NavigationLink(destination: UserView(user: user)) {
                        VStack(alignment: .leading) {
                            Text(user.wrappedName)
                                .font(.headline)
                            Text("Company: \(user.wrappedCompany)")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("UsersFriendsCoreData")
        }
//        .onAppear(perform: checkData)
    }

//    func checkData() {
//        if users.isEmpty {
//            initializer.fetchData(moc: moc)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

