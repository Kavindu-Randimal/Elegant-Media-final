//
//  LoginApi.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import Foundation

class LoginAPI {
    static let shared = LoginAPI()

    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
