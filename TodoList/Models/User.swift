//
//  User.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import Foundation

struct User : Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let joinedOn: TimeInterval
    let profile: String
}
