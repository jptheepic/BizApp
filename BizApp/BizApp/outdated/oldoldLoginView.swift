//
//  LoginView.swift
//  BizApp
//
//  Created by JP Latreille on 10/10/22.
//

import SwiftUI

struct oldoldLoginView: View {
    @StateObject private var loginVM = LoginViewModel()

    var body: some View {
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors:[.purple,.red],startPoint: .topLeading,endPoint: .bottomTrailing))
                .frame(width: 1000,height:400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            VStack(spacing: 20) {
                Text("Biz Tracker")
                    .foregroundColor(.white)
                    .font(.system(size:40, weight:.bold, design: .rounded))
                    .offset(x: 0, y:-100)
                TextField("Email", text: $loginVM.credentials.email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .keyboardType(.emailAddress)
                    .placeholder(when:loginVM.credentials.email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundColor(.white)
                SecureField("Password", text: $loginVM.credentials.password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when:loginVM.credentials.password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                if loginVM.showProgressView {
                    ProgressView()
                }
                Rectangle()
                    .frame(width:350, height: 1)
                    .foregroundColor(.white)
                Button{
                    loginVM.login { success in
                        
                    }
                } label: {
                    Text("Login for Biz")
                        .bold()
                        .frame(width:200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.purple,.red],startPoint: .top,endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                    .padding(.bottom,10)
                    .disabled(loginVM.loginDisabled)
                    
                }
                .padding(.top)
                .offset(y:100)
                
                Button{
//                    APIService().register(credentials: loginVM.credentials)
                } label: {
                    Text("Don't have an account? Create Account")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y:110)
            }
        }
    }
        
}


extension View{
    func placeholder<Content: View>(
        when shouldShow:Bool,
    alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content)->some View {
            
        ZStack(alignment:alignment){
            placeholder().opacity(shouldShow ? 1:0)
            self
        }
    }
}
        
struct oldoldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
