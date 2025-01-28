import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                // Calendar header
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    Text("March 2023")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Menu {
                        Button("Timeline", action: {})
                        Button("Calendar", action: {})
                    } label: {
                        Text("Timeline")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(15)
                    }
                }
                .padding()
                
                // Calendar grid would go here
                
                // Timeline
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(1...8, id: \.self) { hour in
                            HStack {
                                Text("\(hour) AM")
                                    .frame(width: 50)
                                if hour == 1 {
                                    TimelineTask(title: "BoxSite Design System", color: .purple)
                                } else if hour == 4 {
                                    TimelineTask(title: "Eliezer brand guideline &", color: .blue)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct TimelineTask: View {
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(color.opacity(0.3))
                .cornerRadius(10)
            Spacer()
            Image(systemName: "doc.text")
                .foregroundColor(.gray)
        }
    }
} 