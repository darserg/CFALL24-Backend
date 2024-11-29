//
//  User.swift
//  fall24
//
//  Created by Сергей Дарьин on 29.11.2024.
//
import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "login")
    var login: String
    
    @Field(key: "password")
    var password: String
    
    init () {}
    
    init (id: UUID? = nil, login: String, password: String) {
        self.id = id
        self.login = login
        self.password = password
    }
}
