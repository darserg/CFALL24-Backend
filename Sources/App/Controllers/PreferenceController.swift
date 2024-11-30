//
//  PreferenceController.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//

import Vapor

struct PreferenceController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let preferences = routes.grouped("preferences")
        preferences.get(use: getAll)
        preferences.post(use: create)
        preferences.put(":prefID", use: update)
        preferences.delete(":prefID", use: delete)
        preferences.get(":prefID", use: getOne)
    }
    
    func getAll(req: Request) -> EventLoopFuture<[Question]> {
        Question.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Preference> {
        let preference = try req.content.decode(Preference.self)
        return preference.save(on: req.db).map { preference }
    }
    
    func update(req: Request) throws -> EventLoopFuture<Preference> {
        let preference = try req.content.decode(Preference.self)
        return Preference.find(req.parameters.get("prefID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { foundPref in
                foundPref.login = preference.login
                foundPref.category = preference.category
                foundPref.answer = preference.answer
                return foundPref.save(on: req.db).map { foundPref }
            }
    }
    
    func delete(req: Request) -> EventLoopFuture<HTTPStatus> {
        Preference.find(req.parameters.get("prefID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    func getOne(req: Request) -> EventLoopFuture<Preference> {
        Preference.find(req.parameters.get("prefID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
}
