import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var tasks: [Task]
    
    @State private var title = ""
    @State private var note = ""
    @State private var isPriority = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Task Title", text: $title)
                    TextField("Notes (optional)", text: $note)
                    Toggle("Priority Task", isOn: $isPriority)
                }
            }
            .navigationTitle("New Task")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Add") {
                    let newTask = Task(title: title, isCompleted: false, note: note.isEmpty ? nil : note)
                    tasks.append(newTask)
                    dismiss()
                }
                .disabled(title.isEmpty)
            )
        }
    }
} 