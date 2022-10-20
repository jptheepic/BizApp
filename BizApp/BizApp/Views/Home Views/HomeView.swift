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
            VStack {
                Text("Logged in as \(userInfo.user.name)")
                NavigationLink {
                    LogGameView()
                } label: {
                    Text("Log Biz Game")
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(15)

                }
                
                NavigationLink {
                    LeaderboardView()
                } label: {
                    Text("View Leaderboard")
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(15)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out") {
                        FBAuth.logout { (result) in
                            print("Logged out")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                         NavigationLink(destination: UserProfileView()) {
                              Text("User Profile")
                         }
                         
                      })
                    }
                }
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
            .environmentObject(UserInfo())
    }
}
