//
//  Questions.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//
import Fluent
import Vapor

final class Question: Model, Content {
    static let schema = "questions"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "answer")
    var answer: Int
    
    init() {}
    
    init (id: UUID? = nil, category: String, anwer: Int) {
        self.id = id
        self.category = category
        self.answer = answer
    }
}
