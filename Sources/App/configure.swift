import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    app.databases.use(.postgres(
        hostname: "localhost",
        port: 5432,
        username: "postgres",
        password: "aboba",
        database: "users"
    ), as: .psql)
    
    app.databases.use(.postgres(
        hostname: "localhost",
        port: 5432,
        username: "posgres",
        password: "aboba",
        database: "preferences"
    ), as: .psql)
    
    app.databases.use(.postgres(
        hostname: "localhost",
        port: 5432,
        username: "postgres",
        password: "aboba",
        database: "question"
    ), as: .psql)
    
    app.migrations.add(CreateUser())
    app.migrations.add(CreateQuestion())
    app.migrations.add(CreatePreference())
    
    try app.autoMigrate().wait()
    
    try routes(app)
}
