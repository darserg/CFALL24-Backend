import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    app.databases.use(.postgres(
        hostname: "localhost",
        port: 5432,
        username: "postgres",
        password: "aboba",
        database: "AbobaDB"
    ), as: .psql)
    
    app.migrations.add(CreateUser())
    try app.autoMigrate().wait()
    
    try routes(app)
}
