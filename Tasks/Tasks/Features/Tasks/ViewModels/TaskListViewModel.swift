import Foundation
import Observation

@Observable
public final class TaskListViewModel {
    public var tasks: [Task] = []
    public var filterType: TaskFilterType = .all

    public init() { loadInitialTasks() }
    private func loadInitialTasks() {
        tasks = [
            Task(title: "Read documentation", isCompleted: false),
            Task(title: "Apply SRP in view", isCompleted: true),
            Task(title: "Refactor logic", isCompleted: false)
        ]
    }

    public var visibleTasks: [Task] {
        filterType.strategy.filter(tasks)
    }

    public func toggleCompletion(of task: Task) {
        guard let idx = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[idx].isCompleted.toggle()
    }
}
