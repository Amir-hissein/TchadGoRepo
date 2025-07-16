//
//  ForgotPasswordView.swift
//  TchadGo
//
//  Created by Amir hissein on 16.07.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var showSuccessAnimation = false
    // Animation control states
    @State private var animateHeader = false
    @State private var animateForm = false
    @State private var animateButton = false
    @State private var animateBackButton = false
    @State private var rotatePlane = false
    @State private var flyAwayPlane = false

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Header
                Spacer()
                Image("eplan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 80)
                    .foregroundColor(.black.opacity(0.3))
                    .rotationEffect(.degrees(rotatePlane ? 360 : 0))
                    .offset(x: flyAwayPlane ? 200 : 0, y: flyAwayPlane ? -200 : (animateHeader ? 0 : 20))
                    .opacity(flyAwayPlane ? 0 : (animateHeader ? 1 : 0))
                    .animation(.easeInOut(duration: 1.2), value: flyAwayPlane)
                    .animation(.easeInOut(duration: 1.5), value: rotatePlane)
                    .animation(.easeOut.delay(0.2), value: animateHeader)

                VStack(alignment: .leading, spacing: 10) {
                    VStack {
                        Text("Forgot Password")
                            .font(.title).bold()
                            .foregroundColor(.init(hex: "29aa96"))
                        Text("Please enter your email to receive a password reset link.")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .multilineTextAlignment(.center)
                    .opacity(animateHeader ? 1 : 0)
                    .offset(y: animateHeader ? 0 : 20)
                    .animation(.easeOut.delay(0.3), value: animateHeader)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                // Email Field
                VStack {
                    CustomTextField(icon: "envelope", title: "Email", hint: "Enter your email", value: $email, shoPassword: .constant(false))
                        .padding(.horizontal)
                        .opacity(animateForm ? 1 : 0)
                        .offset(y: animateForm ? 0 : 20)
                        .animation(.easeOut.delay(0.4), value: animateForm)
                }

                // Send Button
                Button(action: {
                    if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !email.contains("@") {
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

                        // Auto hide success animation and go back
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSuccessAnimation = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                dismiss()
                            }
                        }
                    }
                }) {
                    Text("Send Reset Link")
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "29aa96"))
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .opacity(animateButton ? 1 : 0)
                .offset(y: animateButton ? 0 : 20)
                .animation(.easeOut.delay(0.5), value: animateButton)

                // Success animation
                if showSuccessAnimation {
                    ifView()
                }

                Spacer()

                // Back button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                   
                }
                .padding(.bottom)
                .opacity(animateBackButton ? 1 : 0)
                .offset(y: animateBackButton ? 0 : 20)
                .animation(.easeOut.delay(0.6), value: animateBackButton)
            }
            .padding(.top)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Notice"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .onAppear {
                animateHeader = true
                animateForm = true
                animateButton = true
                animateBackButton = true
                rotatePlane = true
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(hex: "29aa96"))
                    }
                }
            }
        }
    }
}

@ViewBuilder
func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, shoPassword: Binding<Bool>) -> some View {
    VStack(alignment: .leading, spacing: 12) {
        Label {
            Text(title)
                .foregroundColor(.gray)
        } icon: {
            Image(systemName: icon)
        }
        .foregroundColor(Color.black.opacity(0.8))

        if title.contains("Password") && !shoPassword.wrappedValue {
            SecureField(hint, text: value)
                .padding(.top, 2)
        } else {
            TextField(hint, text: value)
                .padding(.top, 2)
        }

        Divider()
            .background(Color.black.opacity(0.4))
    }
}

#Preview {
    ForgotPasswordView()
}
