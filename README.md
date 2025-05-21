# Task Manager App

## Overview

A simple task management application built with SwiftUI, following advanced declarative and clean architecture principles.

## Features

* Display all, completed, or pending tasks.
* Toggle task completion with smooth animations and haptic feedback.
* Accessibility support with VoiceOver announcements.

## Architecture

### SOLID Principles

* **Single Responsibility**: Views handle UI; view models handle state; models represent data.
* **Open/Closed**: Filtering strategies are extensible via `TaskFiltering` protocols.
* **Dependency Inversion**: View models depend on abstractions (`TaskFiltering`), not concrete implementations.

### Layer Separation

* **Model**: `Task` struct represents an individual task.
* **Filtering**: `TaskFiltering` protocol and concrete filters (`AllTasksFilter`, `CompletedTasksFilter`, `PendingTasksFilter`).
* **ViewModel**: `TaskListViewModel` manages tasks, filter state, and business logic.
* **View**: SwiftUI views (`TaskListView`, `TasksAppView`) render UI and bind to view model.

## SwiftUI Lifecycle & State

* `@State` for local view state (e.g., filter selection).
* `@StateObject` / `@ObservedObject` for view model observation.
* `@Binding` to pass state down the view hierarchy.
* SwiftUI automatically rebuilds views on state change, ensuring visual consistency.

## Property Wrappers

* `@State` and `@StateObject` in `TasksAppView` for view model.
* `@Observable` in `TaskListViewModel` to publish changes.
* `@Binding` for two-way data flow when needed.
* `@EnvironmentObject` can be applied for shared data across views.

## Installation

1. Clone the repository.
2. Open `TasksApp.playground` in Xcode 15 or later.
3. Run live preview or build the app target.

## Usage

* Tap filters to view tasks by status.
* Tap a task to toggle completion state.

## Contributing

Feel free to open issues or submit pull requests.

## License

MIT License.
