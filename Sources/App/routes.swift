import Fluent
import Vapor

func routes(_ app: Application) throws {

    app.get("status") { req async -> String in
        "UP"
    }

    try app.register(collection: TodoController())
}