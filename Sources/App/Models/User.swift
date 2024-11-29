//
//  User.swift
//  fall24
//
//  Created by Сергей Дарьин on 29.11.2024.
//

import Vapor

struct User: Content {
    var id: Int
    var login: String
    var password: String
}
