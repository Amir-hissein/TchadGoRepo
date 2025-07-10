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
            VStack {
                Spacer()
                switch selectedTab {
                case .home: Home(username: "user")
                        .padding(.top, -30)
                    
                case .search: MainTouristView()
                        .padding(.top, -30)
                case .add: Text("Ajouter")
                case .favorites: Text("Favoris")
                case .settings: Text("Paramètres")
                }
                Spacer()
                CustomTabBar(selectedTab: $selectedTab, animation: animation)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .leading)
        
    }
}

enum Tab: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case add = "map.circle.fill"
    case favorites = "heart"
    case settings = "gear"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
   
    var animation: Namespace.ID
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                GeometryReader { geo in
                    Button {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(hex: "29aa96")).opacity(0.1)
                                    .frame(width: 60, height: 50)
                                    .matchedGeometryEffect(id: "tabBackground", in: animation)
                                    .offset(y: -2)
                                    .shadow(color: Color(hex: "29aa96"), radius: 10, x: 0, y: 5)
                                    .blendMode(.sourceAtop)
                            }

                            Image(systemName: tab.rawValue)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(selectedTab == tab ? .init(hex: "29aa96") : .gray)
                                .frame(maxWidth: .infinity)
                                .offset(y: selectedTab == tab ? -40 : 1)
                        }
                    }
                }
                .frame(height: 60)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .background(
            BlurView(style: .systemUltraThinMaterialLight)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color(hex: "29aa96"), radius: 0 )
                .blendMode(.sourceAtop)
               
        )
        .padding(.horizontal)
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
     
#Preview {
    TabbarView()
}
