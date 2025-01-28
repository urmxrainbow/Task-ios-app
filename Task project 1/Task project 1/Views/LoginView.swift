import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                Text("Welcome Back")
                    .font(.title)
                    .bold()
                
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
                
                // Login Button
                Button(action: {
                    isLoggedIn = true
                    dismiss()
                }) {
                    Text("Login")
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
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Close") {
                dismiss()
            })
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