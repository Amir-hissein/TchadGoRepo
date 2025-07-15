import SwiftUI

// MARK: - TabBar Principale
struct LiquidGlassTabBar: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab: Int, CaseIterable {
        case home, search, favorites, profile
        
        var icon: String {
            switch self {
            case .home: return "house.fill"
            case .search: return "magnifyingglass"
            case .favorites: return "heart.fill"
            case .profile: return "person.fill"
            }
        }
        
        var title: String {
            switch self {
            case .home: return "Accueil"
            case .search: return "Recherche"
            case .favorites: return "Favoris"
            case .profile: return "Profil"
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Contenu des onglets
            TabView(selection: $selectedTab) {
                Color.blue.ignoresSafeArea().tag(Tab.home)
                Color.green.ignoresSafeArea().tag(Tab.search)
                Color.purple.ignoresSafeArea().tag(Tab.favorites)
                Color.orange.ignoresSafeArea().tag(Tab.profile)
            }
            
            // Barre d'onglets Glass
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    GlassTabButton(
                        tab: tab,
                        selectedTab: $selectedTab
                    )
                    Spacer()
                }
            }
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial) // Effet glass iOS
                    .overlay(
                        Capsule()
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 20)
            )
            .padding(.bottom, 10)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - Bouton personnalisé
struct GlassTabButton: View {
    let tab: LiquidGlassTabBar.Tab
    @Binding var selectedTab: LiquidGlassTabBar.Tab
    @Namespace private var animation
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 4) {
                ZStack {
                    if selectedTab == tab {
                        Circle()
                            .fill(.white.opacity(0.2))
                            .blur(radius: 5)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: selectedTab == tab ? 24 : 22))
                        .foregroundColor(selectedTab == tab ? .white : .white.opacity(0.7))
                }
                .frame(width: 50, height: 30)
                
                Text(tab.title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(selectedTab == tab ? .white : .white.opacity(0.7))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Prévisualisation
struct LiquidGlassTabBar_Previews: PreviewProvider {
    static var previews: some View {
        LiquidGlassTabBar()
            .background(
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
    }
}
#Preview {
    LiquidGlassTabBar()
}
