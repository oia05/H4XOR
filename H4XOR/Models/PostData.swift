//
//  PostData.swift
//  H4XOR
//
//  Created by OmarAssidi on 29/10/2023.
//

import Foundation

struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let url: String?
    let title: String
    let points: Int
    var id: String {
        get {
            return objectID
        }
    }
}
