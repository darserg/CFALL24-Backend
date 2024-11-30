//
//  Preference.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//

import Fluent
import Vapor

final class Preference: Model, Content {
    static let schema = "preferences"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "login")
    var login: String
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "answer")
    var answer: Int
    
    init () {}
    
    init (id: UUID? = nil, login: String, category: String, answer: Int) {
        self.id = id
        self.login = login
        self.category = category
        self.answer = answer
    }
}
