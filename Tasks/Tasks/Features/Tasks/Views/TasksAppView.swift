import SwiftUI

public struct TasksAppView: View {
    @State private var viewModel = TaskListViewModel(repository: MockTaskRepository())

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Your Task Manager")
                    .font(.title2).fontWeight(.semibold)
                    .padding(.top, 24)

                TaskSegmentedControl(viewModel: viewModel)

                TaskListView(viewModel: viewModel)
            }
            .padding()
            .background(Color(UIColor.systemGray6).ignoresSafeArea())
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
