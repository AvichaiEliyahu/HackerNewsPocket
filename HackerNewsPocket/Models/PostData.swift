//
//  PostData.swift
//  HackerNewsPocket
//
//  Created by Avichai Eliyahu on 09/04/2023.
//

import Foundation
struct Result: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
