//
//  HotelAPI.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var hotels = [HotelModel]()
    
    func fetch() {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            do{
                if let data = data {
                    
                    let result = try JSONDecoder().decode( Hotels.self, from: data )
                    DispatchQueue.main.async {
                        self.hotels = result.data;
                    }
                }else{
                    print("no data")
                }
            }catch (let error){
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
