//
//  CreteUser.swift
//  fall24
//
//  Created by Сергей Дарьин on 29.11.2024.
//

import Fluent
import Vapor

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("login", .string, .required)
            .field("password", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("users").delete()
    }
}
