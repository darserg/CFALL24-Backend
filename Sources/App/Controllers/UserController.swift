//
//  UserController.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//

import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: getAll)
        users.post(use: create)
        users.put(":userID", use: update)
        users.delete(":usersID", use: delete)
        users.get(":userID", use: getOne)
    }
    
    func getAll(req: Request) -> EventLoopFuture<[User]> {
        User.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
    }
    
    func update(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { foundUser in
                foundUser.login = user.login
                foundUser.password = user.password
                return foundUser.save(on: req.db).map { foundUser }
            }
    }
    
    func delete(req: Request) -> EventLoopFuture<HTTPStatus> {
        User.find(req.parameters.get("userId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    func getOne(req: Request) -> EventLoopFuture<User> {
        User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
}
