//
//  RootView.swift
//  TchadGo
//
//  Created by Amir hissein on 5.07.2025.
//

import SwiftUI

struct RootViews: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""

    var body: some View {
        ZStack {
            Group {
                if !networkMonitor.isConnected {
                    NoConnexionView()
                        .transition(.opacity.combined(with: .slide))
                } else if networkMonitor.isConnectionConstrained || networkMonitor.isExpensive {
                    WeakConnectionView()
                        .transition(.opacity.combined(with: .slide))
                } else {
                    GetStarted()
                        .transition(.opacity.combined(with: .slide))
                }
            }
            .animation(.easeInOut(duration: 0.4), value: networkMonitor.isConnected)
            
            // 🔔 Toast View
            if showToast {
                VStack {
                    Spacer()
                    Text(toastMessage)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.bouncy, value: showToast)
                }
            }
        }
        .onReceive(networkMonitor.$isConnected) { isConnected in
            showConnectionToast(connected: isConnected)
        }
        .onAppear {
            networkMonitor.startAutoReconnectCheck()
        }
    }

    func showConnectionToast(connected: Bool) {
        toastMessage = connected ? "✅ Connexion rétablie" : "❌ Connexion perdue"
        withAnimation {
            showToast = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                showToast = false
            }
        }
    }
}

