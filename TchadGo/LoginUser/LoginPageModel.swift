//
//  LoginPageModel.swift
//  TchadGo
//
//  Created by Amir hissein on 15.07.2025.
//

import Foundation

class LoginPageModel: ObservableObject {
    // MARK: - User Input Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var reEnterPassword: String = ""
    // MARK: - UI State
    @Published var showPassword: Bool = false
    @Published var showReEnterPassword: Bool = false
    @Published var registerUser: Bool = false
    // MARK: - Error Handling
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    // MARK: - Reset Fields
    func resetFields() {
        email = ""
        password = ""
        reEnterPassword = ""
        showPassword = false
        showReEnterPassword = false
        errorMessage = ""
        showError = false
    }

    // MARK: - Validate Fields
    func validateFields() -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        // Check if email is valid
        guard !trimmedEmail.isEmpty, trimmedEmail.contains("@"), trimmedEmail.contains(".") else {
            showError(with: "Please enter a valid email.")
            return false
        }

        // Check if password is entered
        guard !password.isEmpty else {
            showError(with: "Please enter your password.")
            return false
        }

        // If registering, confirm password match
        if registerUser && password != reEnterPassword {
            showError(with: "Passwords do not match.")
            return false
        }

        // All validations passed
        clearError()
        return true
    }

    // MARK: - Login Logic
    func login() {
        if validateFields() {
            print("Login successful")
            // Implémente ta logique ici
        }
    }

    // MARK: - Register Logic
    func register() {
        if validateFields() {
            print("Registration successful")
            // Implémente ta logique ici
        }
    }

    // MARK: - Forgot Password Logic
    func forgotPassword() {
        print("Reset password")
        // Implémente ta logique ici
    }

    // MARK: - Helper Methods
    private func showError(with message: String) {
        errorMessage = message
        showError = true
    }

    private func clearError() {
        errorMessage = ""
        showError = false
    }
}
