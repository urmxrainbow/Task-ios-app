//
//  TaskDetailView.swift
//  Task project 1
//
//  Created by rapeephan phanit on 28/1/25.
//
import SwiftUI

struct TaskDetailView: View {
    let task: Task
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Task Title
                Text(task.title)
                    .font(.title2)
                    .bold()
                
                // Task Status
                HStack {
                    Text("Status:")
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                    Text(task.isCompleted ? "Completed" : "In Progress")
                }
                
                // Task Notes
                if let note = task.note {
                    VStack(alignment: .leading) {
                        Text("Notes:")
                            .bold()
                        Text(note)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Close") {
                dismiss()
            })
        }
        .foregroundColor(.white)
        .background(Color.black)
    }
}
