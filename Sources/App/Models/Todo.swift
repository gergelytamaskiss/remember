import Fluent
import Vapor

enum Priority: String, Codable {
    case Low, Normal, High
}

final class Todo: Model, Content {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Enum(key: "priority")
    var priority: Priority

    init() { }

    init(id: UUID? = nil, title: String, priority: Priority) {
        self.id = id
        self.title = title
        self.priority = priority
    }
}
