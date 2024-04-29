//
//  Post.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import Foundation

struct Post: Codable {
    // TODO: Create a Post Struct here
    let id: Int
    let time: Date
    let title: String
    let item: String
    let status: String
    let text: String
    let location: String
    let user_id: Int
//    let photo: String
}


//Id (int)
//Title (String)
//Image (Optional)(Photo)
//Item (String)
//Status (lost/found) (String)
//Text (Optional)(String
//Location (String)
//Timestamp (Datetime)
//User_id (int)
//
