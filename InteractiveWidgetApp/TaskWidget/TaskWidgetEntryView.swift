//
//  TaskWidgetEntryView.swift
//  InteractiveWidgetApp
//
//  Created by TanjilaNur-00115 on 8/11/23.
//

import SwiftUI
import WidgetKit

/// Widget Entry View
struct TaskWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        /// Tasks Widget View
        VStack(alignment: .leading, spacing: 0){
            
            /// Title Bar
            ZStack {
                Color.teal
                Text("Tasks")
                    .fontWeight(.semibold)
                    .padding(.bottom, 0)
            }
            
            /// Tasks List
            VStack(alignment: .leading, spacing: 6){
                
                /// Handle for empty list
                if entry.latestThreeTasks.isEmpty {
                    Text("No Tasks Found!")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    /// Show tasks list if not empty
                    ForEach(entry.latestThreeTasks.sorted{
                        !$0.isCompleted && $1.isCompleted
                    }) { task in
                        HStack(spacing: 6) {
                            
                            /// Checkmark Button to toggle
                            Button(intent: ToggleStateIntent(id: task.id)) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(.blue)
                            }
                            .buttonStyle(.plain)
                            
                            /// Task Title
                            VStack(alignment: .leading, spacing: 4){
                                Text(task.taskTitle)
                                    .textScale(.secondary)
                                    .lineLimit(1)
                                    .strikethrough(task.isCompleted,
                                                   pattern: .solid,
                                                   color: .primary)
                                Divider()
                            }
                        }
                        
                        /// Handle spacing for
                        if task.id != entry.latestThreeTasks.last?.id {
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
            .padding(.leading)
        }
        .fontDesign(.rounded)
    }
}
