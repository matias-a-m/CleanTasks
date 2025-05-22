import Foundation

public struct MockTaskRepository: TaskRepository {
    public init() {}

    public func fetchTasks() -> [Task] {
        return [
            Task(title: "Read documentation", isCompleted: false),
            Task(title: "Apply SRP in view", isCompleted: true),
            Task(title: "Refactor logic", isCompleted: false)
        ]
    }
}
