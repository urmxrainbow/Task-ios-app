import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showLogin: Bool
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                Text("Sign Up")
                    .font(.title)
                    .bold()
                
                // Decorative Image
                HStack {
                    Spacer()
                    Image("hanging_plants") // Add this image to your assets
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    Spacer()
                }
                
                // Form Fields
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                            TextField("your.email@example.com", text: $email)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                            if isPasswordVisible {
                                TextField("Enter your password", text: $password)
                            } else {
                                SecureField("Enter your password", text: $password)
                            }
                            Button(action: { isPasswordVisible.toggle() }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                
                // Next Button
                Button(action: {
                    isLoggedIn = true
                    dismiss()
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Primary"))
                        .cornerRadius(12)
                }
                .disabled(email.isEmpty || password.isEmpty)
                
                // Or Divider
                HStack {
                    VStack { Divider() }
                    Text("or continue with")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    VStack { Divider() }
                }
                .padding(.vertical)
                
                // Social Sign In Buttons
                VStack(spacing: 12) {
                    SocialSignInButton(
                        image: "google_logo",
                        text: "Continue with Google"
                    ) {
                        handleGoogleSignIn()
                    }
                    
                    SocialSignInButton(
                        image: "apple_logo",
                        text: "Continue with Apple"
                    ) {
                        handleAppleSignIn()
                    }
                }
                
                // Sign In Link
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.secondary)
                    Button(action: {
                        dismiss()
                        showLogin = true
                    }) {
                        Text("Sign in")
                            .foregroundColor(Color("Primary"))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func handleGoogleSignIn() {
        // Implement Google Sign In
        isLoggedIn = true
        dismiss()
    }
    
    private func handleAppleSignIn() {
        // Implement Apple Sign In
        isLoggedIn = true
        dismiss()
    }
} 