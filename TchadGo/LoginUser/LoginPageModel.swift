//
//  LoginPageModel.swift
//  TchadGo
//
//  Created by Amir hissein on 15.07.2025.
//

import Foundation

class LoginPageModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var re_Enter_Password: String = ""
    @Published var showPassword: Bool = false
    @Published var showReEnterPassword: Bool = false
    @Published var registerUser: Bool = false
    
    // Nouveaux ajouts :
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    func resetFields() {
        email = ""
        password = ""
        re_Enter_Password = ""
        showPassword = false
        showReEnterPassword = false
        errorMessage = ""
        showError = false
    }
    
    func validateFields() -> Bool {
        // Vérification email vide ou invalide
        if email.trimmingCharacters(in: .whitespaces).isEmpty || !email.contains("@") {
            errorMessage = "Please enter a valid email."
            showError = true
            return false
        }
        
        // Vérification mot de passe vide
        if password.isEmpty {
            errorMessage = "Please enter your password."
            showError = true
            return false
        }
        
        // Enregistrement : vérifier la confirmation
        if registerUser && password != re_Enter_Password {
            errorMessage = "Passwords do not match."
            showError = true
            return false
        }
        
        // Tout est bon
        showError = false
        errorMessage = ""
        return true
    }
    
    func Login() {
        if validateFields() {
            print("Login successful") // Remplacer par ta logique
        }
    }
    
    func Register() {
        if validateFields() {
            print("Registration successful") // Remplacer par ta logique
        }
    }
    
    func ForgotPassword() {
        print("Reset password") // Remplacer par ta logique
    }
}

