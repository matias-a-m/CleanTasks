import SwiftUI

public struct TasksAppView: View {
    @State private var viewModel = TaskListViewModel()

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Your Task Manager")
                    .font(.title2).fontWeight(.semibold)
                    .padding(.top, 24)

                HStack(spacing: 0) {
                    ForEach(TaskFilterType.allCases) { type in
                        Text(type.rawValue)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(viewModel.filterType == type ? .primary : .secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                            .background(viewModel.filterType == type ? Color.white : Color.clear)
                            .cornerRadius(6)
                            .accessibilityLabel("Filtro: \(type.rawValue)")
                            .accessibilityAddTraits(.isButton)
                            .accessibilityAddTraits(viewModel.filterType == type ? .isSelected : [])
                            .accessibilityHint("Muestra solo tareas \(type.rawValue.lowercased())")
                            .onTapGesture {
                                withAnimation { viewModel.filterType = type }
                                HapticManager.shared.notifySuccess()
                                UIAccessibility.post(
                                    notification: .announcement,
                                    argument: "Filtro aplicado: \(type.rawValue)"
                                )
                            }
                    }
                }
                .padding(4)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal)

                TaskListView(viewModel: viewModel)
            }
            .padding()
            .background(Color(UIColor.systemGray6).ignoresSafeArea())
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
