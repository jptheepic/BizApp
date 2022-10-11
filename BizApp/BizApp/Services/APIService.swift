//
//  APIService.swift
//  BizApp
//
//  Created by JP Latreille on 10/10/22.
//

import Foundation
import Firebase

class APIService {
    
    static let shared = APIService()
    
    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) ->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }

}
    func register(credentials: Credentials) -> Bool {
        var noerrors = false
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) {result, error in
            // Build this more out later
            if error != nil {
                print(error!.localizedDescription)
                noerrors = false
            }
            else {
                noerrors = true
            }
        }
        return noerrors
    }
}


