import SwiftUI

public struct TaskSegmentedControl: View {
    @Bindable var viewModel: TaskListViewModel

    public init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(TaskFilterType.allCases) { type in
                Text(type.rawValue)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(viewModel.filterType == type ? .primary : .secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(viewModel.filterType == type ? Color.white : Color.clear)
                    .cornerRadius(6)
                    .accessibilityLabel("Filter: \(type.rawValue)")
                    .accessibilityAddTraits(.isButton)
                    .accessibilityAddTraits(viewModel.filterType == type ? .isSelected : [])
                    .accessibilityHint("Show only tasks \(type.rawValue.lowercased())")
                    .onTapGesture {
                        withAnimation { viewModel.filterType = type }
                        HapticManager.shared.notifySuccess()
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: "Applied filter: \(type.rawValue)"
                        )
                    }
            }
        }
        .padding(4)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
