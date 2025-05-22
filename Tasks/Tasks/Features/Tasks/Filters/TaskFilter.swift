import Foundation

public protocol TaskFiltering {
    func filter(_ tasks: [Task]) -> [Task]
}

public struct AllTasksFilter: TaskFiltering {
    public init() {}
    public func filter(_ tasks: [Task]) -> [Task] { tasks }
}

public struct CompletedTasksFilter: TaskFiltering {
    public init() {}
    public func filter(_ tasks: [Task]) -> [Task] {
        tasks.filter { $0.isCompleted }
    }
}

public struct PendingTasksFilter: TaskFiltering {
    public init() {}
    public func filter(_ tasks: [Task]) -> [Task] {
        tasks.filter { !$0.isCompleted }
    }
}

public enum TaskFilterType: String, CaseIterable, Identifiable {
    case all = "All"
    case completed = "Completed"
    case pending = "Pending"

    public var id: String { rawValue }

    public var strategy: TaskFiltering {
        switch self {
        case .all: return AllTasksFilter()
        case .completed: return CompletedTasksFilter()
        case .pending: return PendingTasksFilter()
        }
    }
}
