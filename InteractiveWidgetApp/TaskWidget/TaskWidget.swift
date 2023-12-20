//
//  TaskWidget.swift
//  TaskWidget
//
//  Created by TanjilaNur-00115 on 7/11/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    /// Widget Placeholder
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(latestThreeTasks: Array(TaskDataModel.shared.tasks.prefix(3)))
    }
    
    /// Prepare for widget Snapshopt
    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> ()) {
        let entry = TaskEntry(latestThreeTasks: Array(TaskDataModel.shared.tasks.prefix(3)))
        completion(entry)
    }
    
    
    /// Widget's timeline provider
    func getTimeline(in context: Context, completion: @escaping (Timeline<TaskEntry>) -> ()) {
        
        let latestThreeTasks = Array(TaskDataModel.shared.tasks.prefix(3))
        let latestEntries = [TaskEntry(latestThreeTasks: latestThreeTasks)]
        print(latestEntries)
        let timeline = Timeline(entries: latestEntries, policy: .atEnd)
        completion(timeline)
    }
}


/// Widget & its configuration
struct TaskWidget: Widget {
    let kind: String = "TaskWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, 
                            provider: Provider()
        ) { entry in
            if #available(iOS 17.0, *) {
                TaskWidgetEntryView(entry: entry)
                    .containerBackground(for: .widget) {
                        Color.white
                    }
                    .invalidatableContent()
                    
            } else {
                TaskWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .containerBackgroundRemovable()
        .description("Interactive widget for updating tasks.")
        .contentMarginsDisabled()
    }
}


/// Preview
#Preview(as: .systemMedium) {
    TaskWidget()
} timeline: {
    TaskEntry(latestThreeTasks: Array(TaskDataModel.shared.tasks.prefix(3)))
}
