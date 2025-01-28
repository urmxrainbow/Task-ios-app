import Foundation

struct Project: Identifiable {
    let id = UUID()
    var title: String
    var members: [String] // List of team members
    var date: Date // Project date
    var status: String // Status of the project (e.g., "In Progress", "Completed")
    var service: String // Type of service associated with the project
    var notes: String // Additional notes for the project
    var tasks: [Task] // List of tasks associated with the project
}

