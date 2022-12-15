//
//  Network.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import Foundation
import SwiftUI

struct Hotels : Decodable {
    let statusCode : Int?
    let data : [HotelModel]
}

struct HotelModel : Decodable {
    let id : Int?
    let title : String?
    let description : String?
    let address : String?
    let postCode : String?
    let phoneNumber : String?
    let latitude : String?
    let longitude : String?
    let image : Images?
}

struct Images : Decodable {
    let small : String?
    let medium : String?
    let large : String?
}
