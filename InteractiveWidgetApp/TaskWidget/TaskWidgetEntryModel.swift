//
//  TaskWidgetEntryModel.swift
//  TaskWidgetExtension
//
//  Created by TanjilaNur-00115 on 8/11/23.
//

import WidgetKit

/// Widget Entry Model
struct TaskEntry: TimelineEntry {
    let date: Date = .now
    var latestThreeTasks: [TaskModel]
}
