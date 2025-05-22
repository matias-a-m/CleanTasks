import SwiftUI

#Preview("All Tasks") {
    let vm = TaskListViewModel(repository: MockTaskRepository())
    vm.filterType = .all
    return NavigationStack {
        VStack(spacing: 24) {
            Text("Your Task Manager")
                .font(.title2).fontWeight(.semibold)
                .padding(.top, 24)

            TaskSegmentedControl(viewModel: vm)
            TaskListView(viewModel: vm)
        }
        .padding()
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
        .navigationTitle("Tasks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

