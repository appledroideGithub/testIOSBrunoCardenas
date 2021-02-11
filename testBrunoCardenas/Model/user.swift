//
//  user.swift
//  testBrunoCardenas
//
//  Created by Bruno Cardenas on 10/02/21.
//

import Foundation

// MARK: - Welcome
struct userList: Decodable {
    let results: [User]
}


// MARK: - Result
struct User: Decodable {
    let gender: String?
    let name: Name
    let email: String?
    let id: ID
    let picture: Picture
    let nat: String?
}
struct ID: Codable {
    let name, value: String?
}

// MARK: - Name
struct Name: Decodable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Decodable {
    let large, medium, thumbnail: String?
}
