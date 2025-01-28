import Foundation

struct Task: Identifiable {
    let id = UUID() // Unique identifier for each task
    var title: String // Title of the task
    var isCompleted: Bool // Status of the task
    var note: String? // Optional notes for the task
    
    // Initializer
    init(title: String, isCompleted: Bool = false, note: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.note = note
    }
}

