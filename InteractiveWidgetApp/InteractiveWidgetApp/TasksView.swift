//
//  ContentView.swift
//  InteractiveWidgetApp
//
//  Created by TanjilaNur-00115 on 7/11/23.
//

import SwiftUI
import WidgetKit

struct TasksView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            /// List Title
            Text("Tasks")
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            List {
                /// Task List
                ForEach(TaskDataModel().tasks.sorted { !$0.isCompleted && $1.isCompleted }) { task in
                        
                        VStack(alignment: .leading, spacing: 4) {
                            /// Task Title
                            Text(task.taskTitle)
                                .textScale(.secondary)
                                .lineLimit(1)
                            Divider()
                        }
                    }
                }
            }
        }
}


#Preview {
    TasksView()
}
