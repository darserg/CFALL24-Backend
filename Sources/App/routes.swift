import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("user") { req -> EventLoopFuture<User> in
        let user = User(id: 1, login: "chert", password: "chert")
        
        return req.eventLoop.makeSucceededFuture(user)
    }

    try app.register(collection: TodoController())
}
