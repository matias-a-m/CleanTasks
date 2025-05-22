import Foundation
import Observation

public protocol TaskRepository {
    func fetchTasks() -> [Task]
}

@Observable
public final class TaskListViewModel {
    public var tasks: [Task] = []
    public var filterType: TaskFilterType = .all
    private let repository: TaskRepository

    public init(repository: TaskRepository) {
        self.repository = repository
        loadTasks()
    }

    private func loadTasks() {
        tasks = repository.fetchTasks()
    }

    public var visibleTasks: [Task] {
        filterType.strategy.filter(tasks)
    }

    public func toggleCompletion(of task: Task) {
        guard let idx = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[idx].isCompleted.toggle()
    }
}
