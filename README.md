# Task Manager App

## Overview

A simple task management application built with SwiftUI, following advanced declarative and clean architecture principles.

## Features

* Display all, completed, or pending tasks.
* Toggle task completion with smooth animations and haptic feedback.
* Accessibility support with VoiceOver announcements.
* Modular filtering and data injection via repositories.

## Architecture

### SOLID Principles

* **Single Responsibility**: Views handle UI; view models handle state; models represent data.
* **Open/Closed**: Filtering strategies are extensible via `TaskFiltering` protocols.
* **Dependency Inversion**: View models depend on abstractions (`TaskFiltering`, `TaskRepository`), not concrete implementations.

### Layer Separation

* **Model**: `Task` struct represents an individual task.
* **Filtering**: `TaskFiltering` protocol and concrete filters (`AllTasksFilter`, `CompletedTasksFilter`, `PendingTasksFilter`).
* **ViewModel**: `TaskListViewModel` manages tasks, filter state, and business logic. It receives a `TaskRepository` dependency for data source abstraction.
* **Repository**: `TaskRepository` protocol with a `MockTaskRepository` implementation for preview and testing.
* **View**: SwiftUI views (`TaskListView`, `TasksAppView`, `TaskSegmentedControl`) render UI and bind to the view model.

## SwiftUI Lifecycle & State

* `@State` for local view state (e.g., view model instantiation).
* `@Observable` in `TaskListViewModel` to publish changes to views.
* `@Binding` for two-way data flow when needed.
* SwiftUI automatically rebuilds views on state change, ensuring visual consistency.

## Property Wrappers

* `@State` in `TasksAppView` to manage view model lifecycle.
* `@Observable` in `TaskListViewModel` to enable reactive updates.
* `@Binding` used in `TaskSegmentedControl` to reflect changes in filter selection.

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
