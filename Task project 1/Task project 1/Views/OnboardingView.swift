import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var showSignUp = false
    @State private var showLogin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Welcome Image and Text
                    VStack(spacing: 20) {
                        Image("planting_illustration") // Add this image to your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                        
                        VStack(spacing: 8) {
                            Text("Welcome to")
                                .font(.title2)
                            Text("Plantly.")
                                .font(.title)
                                .bold()
                        }
                        
                        Text("Start growing your favourite plants with our step-by-step guides and helpful tips.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }
                    
                    // Page Indicators
                    HStack(spacing: 8) {
                        ForEach(0..<3) { index in
                            Circle()
                                .fill(currentPage == index ? Color("Primary") : Color.gray.opacity(0.3))
                                .frame(width: 8, height: 8)
                        }
                    }
                    
                    // Get Started Button
                    Button(action: { showSignUp = true }) {
                        Text("Get Started")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Primary"))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .sheet(isPresented: $showSignUp) {
                SignUpView(showLogin: $showLogin)
            }
            .sheet(isPresented: $showLogin) {
                LoginView()
            }
        }
    }
} 