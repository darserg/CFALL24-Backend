//
//  CreateQuestion.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//

import Fluent
import Vapor

struct CreateQuestion: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("questions")
            .id()
            .field("category", .string, .required)
            .field("answer", .int, .required)
            .create()
    }
    
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("questions").delete()
    }
}
