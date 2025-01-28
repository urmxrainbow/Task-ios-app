//
//  ContentView.swift
//  Task project 1
//
//  Created by rapeephan phanit on 28/1/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else {
            OnboardingView()
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            TaskListView()
                .tabItem {
                    Image(systemName: "checklist")
                }
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
