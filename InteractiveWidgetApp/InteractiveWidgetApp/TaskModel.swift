//
//  TaskModel.swift
//  InteractiveWidgetApp
//
//  Created by TanjilaNur-00115 on 7/11/23.
//

import SwiftUI


/// Task Model
struct TaskModel: Identifiable {
    var id: String = UUID().uuidString
    var taskTitle: String
    var isCompleted: Bool
}


/// Mock Tasks List
class TaskDataModel {
    
    /// Make TaskDataModel SingleTon
    static let shared = TaskDataModel()
    
    /// tasks array to store the Mocks
    var tasks: [TaskModel] = [
        .init(taskTitle: "Prepare WBS", isCompleted: false),
        .init(taskTitle: "Code the App", isCompleted: false),
        .init(taskTitle: "Test all modules", isCompleted: false),
        .init(taskTitle: "Publish!", isCompleted: false)
    ]
}
