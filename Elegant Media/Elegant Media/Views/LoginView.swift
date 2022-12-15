//
//  LoginView.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        Form{
            VStack{
                Image("EMLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300)
                    .aspectRatio(contentMode: .fill)
                VStack{
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("TextColor"))
                    TextField("Enter email", text: $loginVM.credentials.email )
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                .padding(10)
                .listRowSeparator(.hidden)
                
                VStack{
                    Text("Password ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("TextColor"))
                    SecureField("Enter Password", text: $loginVM.credentials.password)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .padding(.bottom,30)
                }
                .padding(10)
                if loginVM.showProgressView {
                    ProgressView()
                }
                Button("Log in") {
                    loginVM.login { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .disabled(loginVM.loginDisabled)
                .frame(width: 60, height: 5)
                .padding()
                .background(Color("ThemeColor"))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .cornerRadius(10)
                .padding(.bottom,20)
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top,50)
            .disabled(loginVM.showProgressView)
            .alert(item: $loginVM.error) { error in
                Alert(title: Text("Invlid Login"), message: Text(error.localizedDescription))
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
}
