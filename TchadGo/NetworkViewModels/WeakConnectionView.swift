//
//  WeakConnectionView.swift
//  TchadGo
//
//  Created by Amir hissein on 5.07.2025.
//

import SwiftUI

struct WeakConnectionView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor

    var body: some View {
        VStack(spacing: 20) {
            ProgressView("Connexion lente...")
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)

            Text("Connexion faible ou limitée.")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.orange)

            Text("Type de connexion : \(networkMonitor.connectionType)")
            if networkMonitor.isExpensive {
                Text("⚠️ Données cellulaires (coûteuses)")
            }
            if networkMonitor.isConnectionConstrained {
                Text("⚠️ Connexion limitée par le système")
            }
        }
        .padding()
    }
}

