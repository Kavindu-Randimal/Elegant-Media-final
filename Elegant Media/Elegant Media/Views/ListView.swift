//
//  ListView.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var authentication: Authentication
    
    @State private var showingAlert = false
    @State private var coverAlert = false
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView
        {
            GeometryReader {geometry in
                VStack{
                    VStack{
                        Text("John Doe")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.top,15)
                        Text("demo@example.com")
                            .font(.system(size: 14))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Button(action: {
                            
                            authentication.updateValidation(success: false)
                        }) {
                            Text("Logout")
                                .frame(minWidth: 0, maxWidth: 180 )
                                .font(.system(size: 18))
                                .padding(10)
                                .foregroundColor(.white)
                        }
                        .background(Color.btnColor)
                        .cornerRadius(10)
                    }
                    ScrollView{
                        ForEach (viewModel.hotels, id: \.id){
                            hotel in
                            VStack(alignment: .leading){
                                NavigationLink(destination: DetailsView()){
                                    HStack{
                                        Image("cat")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment:.leading){
                                            Text(hotel.title!)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .font(.system(size: 13))
                                            
                                            Text(hotel.address!)
                                                .foregroundColor(.black)
                                                .fontWeight(.light)
                                                .font(.system(size: 10))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(3)
                                            Divider()
                                        }
                                        .padding(.top,8.0)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        }
                        .onAppear(perform: {viewModel.fetch()
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.navigationBarTitle("List View")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}




extension Color {
    static let btnColor = Color("buttoncolor")
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
