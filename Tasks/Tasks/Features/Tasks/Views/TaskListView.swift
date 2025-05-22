import SwiftUI

public struct TaskListView: View {
    let viewModel: TaskListViewModel

    public init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List {
            ForEach(viewModel.visibleTasks) { task in
                let willComplete = !task.isCompleted

                HStack {
                    Text(task.title)
                        .font(.system(.body, design: .rounded))
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .scaleEffect(task.isCompleted ? 1 : 0.5)
                        .opacity(task.isCompleted ? 1 : 0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: task.isCompleted)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
                // Accesibilidad
                .accessibilityElement(children: .combine)
                .accessibilityLabel(task.title)
                .accessibilityValue(task.isCompleted ? "Completada" : "Pendiente")
                .accessibilityAddTraits(.isButton)
                .accessibilityAddTraits(task.isCompleted ? .isSelected : [])
                .onTapGesture {
                    withAnimation {
                        viewModel.toggleCompletion(of: task)
                    }
                    HapticManager.shared.notifySuccess()
                    let announcement = willComplete
                        ? "Tarea completada: \(task.title)"
                        : "Tarea marcada como pendiente: \(task.title)"
                    UIAccessibility.post(notification: .announcement, argument: announcement)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .background(Color.clear)
    }
}
