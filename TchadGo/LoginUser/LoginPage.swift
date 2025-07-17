//
//  LoginView.swift
//  TchadGo
//
//  Created by Amir hissein on 4.07.2025.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()

    // Animation states
    @State private var animateTitle = false
    @State private var animateFields = false
    @State private var animateButtons = false
    var body: some View {
        NavigationStack {
            VStack {
                // Header image and background decorations
                VStack(alignment: .center, spacing: 10) {
                    Image("go2")
                        .resizable()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .frame(height: GetRect().height / 4)
                        .background(
                            ZStack {
                                LinearGradient(colors: [
                                    Color(.blue),
                                    Color(.green).opacity(0.2),
                                    Color(.white).opacity(0.4)
                                ], startPoint: .top , endPoint: .bottom)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(.trailing)
                                .offset(y: -55)
                                .ignoresSafeArea()
                                .blur(radius: 3)

                                Circle()
                                    .strokeBorder(Color.white)
                                    .frame(width: 30, height: 30)
                                    .blur(radius: 3)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                    .padding(30)

                                Circle()
                                    .strokeBorder(Color.white)
                                    .frame(width: 23, height: 23)
                                    .blur(radius: 3)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                    .padding(30)
                            }
                        )
                }
                .opacity(animateTitle ? 1 : 0)
                .offset(y: animateTitle ? 0 : -20)
                .animation(.easeOut(duration: 0.5).delay(0.1), value: animateTitle)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        if loginData.showError {
                            Text(loginData.errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                                .animation(.easeInOut, value: loginData.showError)
                        }

                        Text(loginData.registerUser ? "Register" : "Login")
                            .font(.largeTitle).bold()
                            .foregroundColor(loginData.registerUser ? Color.init(hex: "29aa96") : Color.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .opacity(animateTitle ? 1 : 0)
                            .offset(y: animateTitle ? 0 : 20)
                            .animation(.easeOut.delay(0.2), value: animateTitle)

                        Group {
                            CustomTextField(icon: "envelope", title: "Email", hint: "Enter your mail", value: $loginData.email, shoPassword: .constant(false))
                                .padding(.top, 30)

                            CustomTextField(icon: "lock", title: "Password", hint: "Enter your password", value: $loginData.password, shoPassword: $loginData.showPassword)
                                .padding(.top, 10)

                            if loginData.registerUser {
                                CustomTextField(icon: "lock", title: "Re-enter Password", hint: "Re-enter your password", value: $loginData.re_Enter_Password, shoPassword: $loginData.showReEnterPassword)
                                    .padding(.top, 10)
                            }
                        }
                        .opacity(animateFields ? 1 : 0)
                        .offset(y: animateFields ? 0 : 20)
                        .animation(.easeOut(duration: 0.4).delay(0.3), value: animateFields)

                        Button {
                            loginData.ForgotPassword()
                        } label: {
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot password?")
                                    .font(.body)
                                    .foregroundColor(.init(hex: "29aa96"))
                            }
                        }
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .opacity(animateButtons ? 1 : 0)
                        .offset(y: animateButtons ? 0 : 20)
                        .animation(.easeOut.delay(0.4), value: animateButtons)

                        Button {
                            if loginData.registerUser {
                                loginData.Register()
                            } else {
                                loginData.Login()
                            }
                        } label: {
                            Text(loginData.registerUser ? "Register" : "Login")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .background(Color(hex: "29aa96"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .opacity(animateButtons ? 1 : 0)
                        .offset(y: animateButtons ? 0 : 20)
                        .animation(.easeOut.delay(0.5), value: animateButtons)

                        Button {
                            withAnimation {
                                loginData.registerUser.toggle()
                                loginData.resetFields()
                            }
                        } label: {
                            Text(loginData.registerUser ? "Already have an account?" : "Create account")
                                .font(.body)
                                .foregroundColor(.init(hex: "29aa96"))
                        }
                        .padding(.top, 8)
                        .opacity(animateButtons ? 1 : 0)
                        .offset(y: animateButtons ? 0 : 20)
                        .animation(.easeOut.delay(0.6), value: animateButtons)
                    }
                    .padding(30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.white
                        .clipShape(customCorners(corners: [.topLeft, .topRight], radius: 25))
                        .ignoresSafeArea()
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.init(hex: "29aa96"))
            .onAppear {
                animateTitle = true
                animateFields = true
                animateButtons = true
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
        .overlay(
            Group {
                if title.contains("Password") {
                    Button(action: {
                        shoPassword.wrappedValue.toggle()
                    }, label: {
                        Image(systemName: shoPassword.wrappedValue ? "eye.slash" : "eye")
                            .font(.title2).bold()
                            .foregroundColor(.gray)
                    })
                    .offset(y: 8)
                }
            }, alignment: .trailing
        )
    }
}

#Preview {
    LoginPage()
}

extension View {
    func GetRect() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return UIScreen.main.bounds.size
        }
        return window.screen.bounds.size
    }
}
