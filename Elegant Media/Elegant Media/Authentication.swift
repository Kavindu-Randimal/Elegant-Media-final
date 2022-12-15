//
//  Authentication.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Your email or password are incorrect. Please try again. read the readme.md instructions", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
