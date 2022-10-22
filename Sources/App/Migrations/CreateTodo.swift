import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        
        let priority = try await database.enum("priority")
            .case("Low")
            .case("Normal")
            .case("High")
            .create()
        
        try await database.schema("todos")
            .id()
            .field("title", .string, .required)
            .field("priority", priority, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("todos").delete()
    }
}
