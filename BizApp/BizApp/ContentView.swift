//
//  ContentView.swift
//  BizApp
//
//  Created by Jon Latreille on 10/2/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
//    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        Group {
            if userInfo.isUserAuthenticated == .undefined {
                Text("Loading..")
            } else if userInfo.isUserAuthenticated == .signedOut {
                LoginView()
            } else {
                HomeView()
            }
        }
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange()
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    var userInfo = UserInfo()
    static var previews: some View {
        ContentView()
    }
}
