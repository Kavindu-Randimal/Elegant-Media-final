//
//  DetailsView.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var showingAlert = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Image("cat")
                    .resizable()
                    .frame(width: 300,height: 200, alignment: .top)
                Text("Down-sized 4thgeneration leverage")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Text("otam error ut facere laboriosam. Omnis atque eveniet omnis repudiandae et quia itaque. Qui id dignissimos voluptatem voluptatibus voluptas. Praesentium id est dolores libero at nam excepturi perferendis.")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .frame(width: 350)
                    .padding()
                
                .font(.system(size: 18))
            }
            .frame(alignment: .top)
            .navigationBarTitle("Cat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAlert = true
                    }){
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.black)
                            .padding(.trailing)
                        
                    }.alert("Not implemented yet", isPresented: $showingAlert) {
                        Button("OK") { }
                    }
                }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
