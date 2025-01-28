//
//  HomeView.swift
//  Task project 1
//
//  Created by rapeephan phanit on 28/1/25.
//

import SwiftUI

struct HomeView: View {
    @State private var priorityTasks: [Task] = [
        Task(title: "Doing exercise-45 min", isCompleted: true),
        Task(title: "Doing meditation", isCompleted: false),
        Task(title: "Read a self improve", isCompleted: false),
        Task(title: "Buy coffee in the", isCompleted: false)
    ]
    
    @State private var dailyTasks: [Task] = [
        Task(title: "Blockchain-system-redesign-web-page", isCompleted: true),
        Task(title: "Eliezer brand guideline & landing", isCompleted: true),
        Task(title: "Quantumn frontend development", isCompleted: false),
        Task(title: "PlutoPay Design System", isCompleted: false)
    ]
    
    @State private var showingAddTask = false
    @State private var selectedTask: Task?
    @State private var showingTaskDetail = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Yuhuu, your work")
                                .font(.title)
                                .bold()
                            Text("is almost done!")
                                .font(.title)
                                .bold()
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Priority Tasks Card
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("My Priority Task")
                                .bold()
                            Spacer()
                            Button(action: { showingAddTask = true }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ForEach(priorityTasks) { task in
                            TaskRow(task: task)
                                .onTapGesture {
                                    selectedTask = task
                                    showingTaskDetail = true
                                }
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.3))
                    .cornerRadius(15)
                    
                    // Daily Tasks Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("To do today")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button(action: { showingAddTask = true }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ForEach(dailyTasks) { task in
                            TaskRow(task: task)
                                .onTapGesture {
                                    selectedTask = task
                                    showingTaskDetail = true
                                }
                        }
                    }
                }
                .padding()
            }
            .background(Color.black)
            .foregroundColor(.white)
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(tasks: $dailyTasks)
            }
            .sheet(isPresented: $showingTaskDetail) {
                if let task = selectedTask {
                    TaskDetailView(task: task)
                }
            }
        }
    }
}

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
            Text(task.title)
            Spacer()
            Image(systemName: "doc.text")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
