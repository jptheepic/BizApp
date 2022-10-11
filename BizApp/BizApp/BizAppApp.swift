//
//  BizAppApp.swift
//  BizApp
//
//  Created by Jon Latreille on 10/2/22.
//

import SwiftUI
import Firebase

@main
struct BizAppApp: App {
//    @StateObject var authentication = Authentication()
    var userInfo = UserInfo()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
        }
    }
}

