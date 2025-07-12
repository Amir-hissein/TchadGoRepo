//
//  TabbarView.swift
//  TchadGo
//
//  Created by Amir hissein on 10.07.2025.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: Tab = .home
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            // Contenu selon l'onglet
            VStack(spacing: 0) {
                switch selectedTab {
                case .home:
                    Home(username: "user")
                        .padding(.top, -30)
                case .search:
                    MainTouristView()
                        .padding(.top, -30)
                case .logo:
                    Text("Ajouter")
                case .favorites:
                    Text("Mes Favoris")
                case .settings:
                    Text("Paramètres")
                }
                
                Spacer(minLength: 0)
                
                CustomTabBar(selectedTab: $selectedTab, animation: animation)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .leading)
    }
}

enum Tab: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case logo = "Logo" // Remplacez par le nom de votre image
    case favorites = "heart"
    case settings = "gear"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var animation: Namespace.ID
    @State private var tappedTwice = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = tab
                    }
                    
                    // Animation supplémentaire pour le double-tap
                    if selectedTab == tab {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            tappedTwice = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                tappedTwice = false
                            }
                        }
                    }
                } label: {
                    VStack(spacing: 4) {
                        ZStack {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(hex: "29aa96").opacity(0.1))
                                    .matchedGeometryEffect(id: "tabBackground", in: animation)
                                    .frame(width: 60, height: 50)
                                    .shadow(color: Color(hex: "29aa96"), radius: 10, x: 0, y: 5)
                            }
                            
                            // Contenu de l'icône
                            if tab == .logo {
                                Image("go2") // Votre image personnalisée
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color(hex: "29aa96"))
                                    .frame(width: 70, height: 70)
                                    .scaleEffect(selectedTab == tab && tappedTwice ? 1.3 : 1.0)
                                    .foregroundColor(selectedTab == tab ? .init(hex: "29aa96") : .gray)
                            } else {
                                Image(systemName: tab.rawValue)
                                    .font(.system(size: 20, weight: .bold))
                                    .scaleEffect(selectedTab == tab && tappedTwice ? 1.3 : 1.0)
                                    .foregroundColor(selectedTab == tab ? .init(hex: "29aa96") : .gray)
                            }
                        }
                        .offset(y: selectedTab == tab ? -10 : 0)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(TabBarButtonStyle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .background(
            BlurView(style: .systemUltraThinMaterialLight)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color(hex: "29aa96").opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

// Style personnalisé pour les boutons de la tab bar
struct TabBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    TabbarView()
}
