//
//  QuestionController.swift
//  fall24
//
//  Created by Сергей Дарьин on 30.11.2024.
//
import Vapor

struct QuestionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let questions = routes.grouped("questions")
        questions.get(use: getAll)
        questions.post(use: create);
        questions.put(":questionID", use: update)
        questions.delete(":questionID", use: delete)
        questions.get(":questionID", use: getOne)
    }
    
    func getAll(req: Request) -> EventLoopFuture<[Question]> {
        Question.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Question> {
        let question = try req.content.decode(Question.self)
        return question.save(on: req.db).map { question }
    }
    
    func update(req: Request) throws -> EventLoopFuture<Question> {
        let question = try req.content.decode(Question.self)
        return Question.find(req.parameters.get("questionID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { foundQuestion in
                foundQuestion.category = question.category
                foundQuestion.answer = question.answer
                return foundQuestion.save(on: req.db).map { foundQuestion }
        }
    }
    
    func delete(req: Request) -> EventLoopFuture<HTTPStatus> {
        User.find(req.parameters
            .get("questionID"), on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { $0.delete(on: req.db) }
        .transform(to: .ok)
    }
    
    func getOne(req: Request) -> EventLoopFuture<Question> {
        Question.find(req.parameters.get("questionID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
}
