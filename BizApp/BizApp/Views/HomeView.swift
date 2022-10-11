//
//  HomeView.swift
//  BizApp
//
//  Created by JP Latreille on 10/10/22.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationView {
            Text("Logged in as \(userInfo.user.name)")
                .navigationBarTitle("Firebase Login")
                    .navigationBarItems(trailing: Button("Log Out") {
                        FBAuth.logout { (result) in
                            print("Logged out")
                        }
                    })
                    .onAppear {
                        guard let uid = Auth.auth().currentUser?.uid else {
                            return
                        }
                        FBFirestore.retrieveFBUser(uid: uid) { (result) in
                            switch result {
                            case .failure(let error):
                                print(error.localizedDescription)
                                //display some kid of alreat user here
                            case .success(let user):
                                self.userInfo.user = user
                            }
                        }
                    }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
