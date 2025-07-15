//
//  LoginPageModel.swift
//  TchadGo
//
//  Created by Amir hissein on 15.07.2025.
//

import Foundation

class LoginPageModel: ObservableObject {
    // login propirties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // register  propirties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // login call..
    func Login() {
        
    }
    func Register() {
        
    }
    
    func ForgotPassword() {
        
    }
}
