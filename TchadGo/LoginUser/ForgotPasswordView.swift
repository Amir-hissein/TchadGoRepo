//
//  ForgotPasswordView.swift
//  TchadGo
//
//  Created by Amir hissein on 16.07.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var showSuccessAnimation = false
    // Animation States
    @State private var animateHeader = false
    @State private var animateForm = false
    @State private var animateButton = false
    @State private var animateBackButton = false
    @State private var rotatePlane = false
    @State private var flyAwayPlane = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 25) {
                Spacer()
                // MARK: - Plane Image (Animation)
                Image("eplan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 80)
                    .rotationEffect(.degrees(rotatePlane ? 360 : 0))
                    .offset(x: flyAwayPlane ? 200 : 0, y: flyAwayPlane ? -200 : (animateHeader ? 0 : 20))
                    .opacity(flyAwayPlane ? 0 : (animateHeader ? 1 : 0))
                    .animation(.easeInOut(duration: 1.2), value: flyAwayPlane)
                    .animation(.easeInOut(duration: 1.5), value: rotatePlane)
                    .animation(.easeOut.delay(0.2), value: animateHeader)

                // MARK: - Title & Subtitle
                VStack(spacing: 10) {
                    Text("Forgot Password")
                        .font(.title).bold()
                        .foregroundColor(Color(hex: "29aa96"))
                    Text("Please enter your email to receive a password reset link.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .multilineTextAlignment(.center)
                .opacity(animateHeader ? 1 : 0)
                .offset(y: animateHeader ? 0 : 20)
                .animation(.easeOut.delay(0.3), value: animateHeader)
                .padding()

                // MARK: - Email TextField
                customTextField(
                    icon: "envelope",
                    title: "Email",
                    hint: "Enter your email",
                    value: $email,
                    showPassword: .constant(false)
                )
                .padding(.horizontal)
                .opacity(animateForm ? 1 : 0)
                .offset(y: animateForm ? 0 : 20)
                .animation(.easeOut.delay(0.4), value: animateForm)

                // MARK: - Send Reset Button
                Button(action: handleSend) {
                    Text("Send Reset Link")
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "29aa96"))
                        .shadow(radius: 3)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .opacity(animateButton ? 1 : 0)
                .offset(y: animateButton ? 0 : 20)
                .animation(.easeOut.delay(0.5), value: animateButton)

                // MARK: - Success Animation
                if showSuccessAnimation {
                    // Remplace IfView() par ta vue d’animation de succès
                    SuccessAnimationView()
                }

                Spacer()

                // MARK: - Back Button (in toolbar)
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    EmptyView() // Bouton invisible, tu peux ajouter un label ici si besoin
                }
                .padding(.bottom)
                .opacity(animateBackButton ? 1 : 0)
                .offset(y: animateBackButton ? 0 : 20)
                .animation(.easeOut.delay(0.6), value: animateBackButton)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Notice"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                animateHeader = true
                animateForm = true
                animateButton = true
                animateBackButton = true
                rotatePlane = true
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {ToolbarItem(placement: .navigationBarLeading) { Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(hex: "29aa96"))
                }
            }
        }
    }

    // MARK: - Handle Send Reset Action
    private func handleSend() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedEmail.isEmpty || !trimmedEmail.contains("@") {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            showSuccessAnimation = false
        } else {
            alertMessage = "A reset link has been sent to \(email)."
            showAlert = true
            withAnimation {
                showSuccessAnimation = true
                flyAwayPlane = true
            }
            email = ""

            // Auto dismiss after 4.6 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    showSuccessAnimation = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    dismiss()
                }
            }
        }
    }

    // MARK: - Custom TextField (à adapter ou remplacer selon ton code)
    @ViewBuilder
    private func customTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .foregroundColor(.gray)
            TextField(hint, text: value)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, 2)
            Divider()
                .background(Color.black.opacity(0.4))
        }
    }
}

// Remplace SuccessAnimationView par ta propre vue d’animation si nécessaire
struct SuccessAnimationView: View {
    var body: some View {
        Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 100))
            .foregroundColor(Color(hex: "29aa96"))
            .transition(.scale)
            .padding()
    }
}

#Preview {
    ForgotPasswordView()
}
