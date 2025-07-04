//
//  ContentView.swift
//  TchadGo
//
//  Created by Amir hissein on 28.06.2025.
//

import SwiftUI

struct ContentView: View {
    // États pour les champs et la validation
    @State private var nom: String = ""
    @State private var prenom: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                // --- Affichage conditionnel du message de bienvenue ---
                if isLoggedIn {
                    HStack { // HStack pour aligner à gauche
                            Text("👋 Bienvenue, \(nom) !")
                                .font(.title2)
                                .padding(.leading, 20)
                                .foregroundColor(.gray)
                                Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                              
                }
                // --- Formulaire sinon ---
                else {
                    VStack(spacing: 16) {
                        TextField("Nom", text: $nom)
                            .textFieldStyle(.roundedBorder)
                        TextField("Prénom", text: $prenom)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Valider") {
                            if nom.isEmpty || prenom.isEmpty {
                                showAlert = true // Affiche l'alerte si champs vides
                            } else {
                                isLoggedIn = true // Connecte l'utilisateur
                            }
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    .padding()
                }
            }
            .navigationTitle(isLoggedIn ? "Accueil" : "Inscription")
            .alert("Champs obligatoires", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Veuillez remplir tous les champs.")
            }
        }
    }
}

// Prévisualisation

#Preview {
    ContentView()
       
}
