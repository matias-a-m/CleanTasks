import SwiftUI

#Preview("All Tasks") {
    let vm = TaskListViewModel()
    vm.filterType = .all
    return TaskListView(viewModel: vm)
}

#Preview("Completed Only") {
    let vm = TaskListViewModel()
    vm.filterType = .completed
    return TaskListView(viewModel: vm)
}

#Preview("Pending Only") {
    let vm = TaskListViewModel()
    vm.filterType = .pending
    return TaskListView(viewModel: vm)
}

#Preview("Empty List") {
    let vm = TaskListViewModel()
    vm.tasks = []
    return TaskListView(viewModel: vm)
}

#Preview("App Entry") {
    TasksAppView()
}
