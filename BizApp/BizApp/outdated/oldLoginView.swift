//
//  LoginView.swift
//  BizApp
//
//  Created by JP Latreille on 10/10/22.
//

import SwiftUI

struct oldLoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var userInfo: UserInfo
   
    var body: some View {
        VStack {
                        
            Text("Biz Tacker")
                .font(.largeTitle)
            TextField("Email Address", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $loginVM.credentials.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if loginVM.showProgressView {
                ProgressView()
            }
            Button("Log in") {
                loginVM.login { success in
                    authentication.updateValdidation(success: success)
                    self.userInfo.isUserAuthenticated = .signedIn
                }
            }
            .bold()
            .frame(width:200, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.linearGradient(colors: [.purple,.red],startPoint: .top,endPoint: .bottomTrailing))
            )
            .foregroundColor(.white)
            .disabled(loginVM.loginDisabled)
            .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),  to: nil, from: nil, for: nil)
                }
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) {error in
            Alert(title: Text("Invalid Login"),message: Text(error.localizedDescription))
        }
    }
}

struct oldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
