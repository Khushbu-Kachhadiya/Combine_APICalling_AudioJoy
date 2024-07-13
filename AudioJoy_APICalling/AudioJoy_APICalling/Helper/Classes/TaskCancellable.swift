//
//  TaskCancellable.swift
//  e-vehicle-charging
//
//  Created by Developer1 on 10/04/24.
//

import Foundation

// MARK: - TaskCancellable
class TaskCancellable: Hashable {
    static func == (lhs: TaskCancellable, rhs: TaskCancellable) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    private let id = UUID()
    private let task: Task<Void, Never>

    init(task: Task<Void, Never>) {
        self.task = task
    }

    deinit {
        self.task.cancel()
    }
}

extension Task where Success == Void, Failure == Never {
    func store(in taskCancellable: inout Set<TaskCancellable>) {
        taskCancellable.insert(TaskCancellable(task: self))
    }
}
