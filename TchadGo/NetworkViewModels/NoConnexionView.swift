//
//  NoConnexionView.swift
//  TchadGo
//
//  Created by Amir hissein on 5.07.2025.
//
import SwiftUI

struct NoConnexionView: View {
    @ObservedObject var networkMonitor = NetworkMonitor.shared
    @State private var animate = false

    var body: some View {
        ZStack(alignment: .center) {
            // Cercles animés en arrière-plan
            ForEach(0..<5, id: \.self) { index in
                let size = CGFloat(60 + index * 20)
                let offsetValue = CGFloat(40 * index)
                let animationSpeed = Double(1.5 + Double(index) * 0.3)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color(for: index).opacity(0.8), .clear]),
                            center: .center,
                            startRadius: 10,
                            endRadius: size / 2
                        )
                    )
                    .frame(width: size, height: size)
                    .scaleEffect(animate ? 1.2 : 0.8)
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .offset(
                        x: animate ? offsetValue : -offsetValue,
                        y: animate ? -offsetValue : offsetValue
                    )
                    .blendMode(.screen)
                    .animation(
                        .easeInOut(duration: animationSpeed)
                            .repeatForever(autoreverses: true),
                        value: animate
                    )
            }

            // Contenu principal
            ScrollView {
                VStack(spacing: 20) {
                    Image("logo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .offset(y: -20)

                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.4)
                        .foregroundColor(.gray.opacity(0.3))

                    Text("Erreur de connexion!")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Veuillez réessayer lorsque vous êtes connecté à Internet")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .foregroundColor(.gray)

                    Spacer(minLength: 20)

                    Button(action: {
                        if networkMonitor.isConnected {
                            networkMonitor.checkConnection()
                        } else {
                            print("Veuillez contrôler votre connexion !")
                        }
                    }) {
                        Text("Réessayer")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(.ultraThinMaterial)
                            .foregroundColor(Color(hex: "29aa96"))
                            .cornerRadius(10)
                            .bold()
                    }
                }
                .padding()
            }
        }
        .onAppear {
            animate = true
            networkMonitor.startAutoReconnectCheck()
        }
    }

    // 🔧 Fonction helper pour couleur dynamique
    func color(for index: Int) -> Color {
        let colors: [Color] = [.cyan, .blue, .purple, .pink, .mint]
        return colors[index % colors.count]
    }
}

#Preview {
    NoConnexionView()
}

