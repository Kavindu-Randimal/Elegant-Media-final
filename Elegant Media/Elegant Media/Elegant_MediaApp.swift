//
//  Elegant_MediaApp.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI

@main
struct Elegant_MediaApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ListView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
