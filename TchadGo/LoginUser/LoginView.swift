//
//  LoginView.swift
//  TchadGo
//
//  Created by Amir hissein on 4.07.2025.
//

import SwiftUI

import SwiftUI

// Structure principale avec gestion d'état
struct RootView: View {
    @State private var loggedInUser: String? // Stocke le nom d'utilisateur
    
    var body: some View {
        NavigationStack {
            if let user = loggedInUser {
                Home(username: user) // Affiche Home si connecté
            } else {
                LoginView(loggedInUser: $loggedInUser) // Sinon affiche le login
            }
        }
    }
}

struct LoginView: View {
    @State private var nom: String = ""
    @Binding var loggedInUser: String? // Binding vers RootView
    @Environment(\.dismiss) var dismiss // Pour fermer la sheet
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Entrez votre nom", text: $nom)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Se connecter") {
                    if !nom.isEmpty {
                        loggedInUser = nom // Met à jour l'état parent
                        dismiss() // Ferme la sheet
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Connexion")
            .padding()
        }
    }
}

struct Homes: View {
    let username: String // Reçoit le nom d'utilisateur
    
    @State var locationShow = false
    @State var UserShow = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                // ... (ton code existant pour Home)
                
                // Bouton profil - ouvre la sheet seulement si besoin
                Button(action: { UserShow = true }) {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                .sheet(isPresented: $UserShow) {
                    LoginView(loggedInUser: .constant(nil)) // Version simplifiée
                }
            }
            .padding()
        }
    }
}

// Prévisualisation

// Prévisualisation
#Preview {
    RootView()
}
