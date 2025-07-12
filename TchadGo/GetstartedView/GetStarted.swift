//
//  GetStarted.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import SwiftUI

struct GetStarted: View {
    @State private var showTabBarView: Bool = false
    @State private var offsetX: CGFloat = -200
    @State private var opacity: Double = 0.5
    
    // 1️⃣ Stocke si l'utilisateur a déjà vu GetStarted (persistant entre les lancements)
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    // 2️⃣ Détecte si l'app vient d'être relancée (fermée puis rouverte)
    @State private var isNewSession: Bool = false
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        Group {
            if !hasCompletedOnboarding || isNewSession {
                // 👉 Afficher GetStarted si :
                // - L'utilisateur n'a jamais terminé l'onboarding (`hasCompletedOnboarding == false`)
                // - OU l'app vient d'être relancée (`isNewSession == true`)
                onboardingView
            } else {
                // 👉 Sinon, aller directement à TabbarView
                TabbarView()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            // 🔄 Détecte quand l'app passe à l'arrière-plan
            if newPhase == .inactive {
                isNewSession = true // Marque pour afficher GetStarted au prochain lancement
            }
        }
    }

    // Vue d'onboarding (GetStarted)
    private var onboardingView: some View {
        NavigationStack {
            VStack {
                // Bouton "Skip" en haut à droite
                HStack {
                    Spacer()
                    Button("Skip") {
                        markOnboardingCompleted()
                    }
                    .foregroundColor(.gray)
                    .padding()
                }

                // Logo avec animation
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: UIScreen.main.bounds.height * 1/3)
                    .offset(x: offsetX)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            offsetX = 0
                            opacity = 1
                        }
                    }

                Spacer()

                // Texte descriptif
                VStack(spacing: 20) {
                    Text("Discover Chad – where vibrant culture, stunning beauty, and extraordinary wonders come together.")
                        .font(.title3.bold())
                        .multilineTextAlignment(.center)

                    Text("Explore tourist attractions start your journey now!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                // Bouton "Get Started"
                Button {
                    markOnboardingCompleted()
                } label: {
                    HStack {
                        Text("Get Started")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    // Marque l'onboarding comme terminé et navigue vers TabbarView
    private func markOnboardingCompleted() {
        hasCompletedOnboarding = true
        showTabBarView = true
    }
}

#Preview {
    GetStarted()
}
