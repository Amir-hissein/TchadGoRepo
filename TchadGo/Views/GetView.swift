//
//  GetView.swift
//  TchadGo
//
//  Created by Amir hissein on 28.06.2025.
//

import SwiftUI

// MARK: - Constants
struct AppConstants {
    static let animationDuration: Double = 0.8
    static let autoScrollInterval: Double = 6.0
    static let cornerRadius: CGFloat = 24
    static let buttonHeight: CGFloat = 56
}

// MARK: - Data Model
struct TravelDestination: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let accentColor: Color
}

// MARK: - Main Onboarding View
struct OnboardingView: View {
    @State private var currentIndex = 0
    @State private var isAnimating = false
    @State private var showHomeView = false
    
    private let destinations: [TravelDestination] = [
        .init(imageName: "logo1",
              title: "Déserts Majestueux",
              subtitle: "Explorez l'immensité dorée du Sahara tchadien",
              accentColor: Color(red: 0.85, green: 0.65, blue: 0.32)),
        
        .init(imageName: "logo1",
              title: "Lacs Légendaires",
              subtitle: "Découvrez les eaux mystérieuses du lac Tchad",
              accentColor: Color(red: 0.22, green: 0.58, blue: 0.72)),
        
        .init(imageName: "logo1",
              title: "Héritage Vivant",
              subtitle: "Plongez dans les traditions séculaires",
              accentColor: Color(red: 0.75, green: 0.32, blue: 0.38))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Carousel
                TabView(selection: $currentIndex) {
                    ForEach(Array(destinations.enumerated()), id: \.element.id) { index, destination in
                        GeometryReader { geometry in
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 400)
                                .overlay(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            .clear,
                                            .clear,
                                            .gray.opacity(0.6)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .tag(index)
                                .offset(x: isAnimating ? 0 : (index == currentIndex ? 50 : 0))
                                .opacity(isAnimating ? 1 : 0.3)
                                .animation(
                                    .easeOut(duration: AppConstants.animationDuration),
                                    value: isAnimating
                                )
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                .onAppear {
                    setupAutoScroll()
                }
                
                // Content Layer
                VStack {
                    Spacer()
                    
                    // Destination Info
                    VStack(spacing: 16) {
                        Text(destinations[currentIndex].title)
                            .font(.system(.title, design: .serif))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .shadow(radius: 5)
                            .transition(.opacity.combined(with: .slide))
                        
                        Text(destinations[currentIndex].subtitle)
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(.gray.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 40)
                    
                    // Page Control
                    HStack(spacing: 10) {
                        ForEach(destinations.indices, id: \.self) { index in
                            Capsule()
                                .fill(index == currentIndex ? destinations[currentIndex].accentColor : Color.white.opacity(0.5))
                                .frame(
                                    width: index == currentIndex ? 30 : 12,
                                    height: 6
                                )
                                .animation(.spring(response: 0.6, dampingFraction: 0.5), value: currentIndex)
                        }
                    }
                    .padding(.bottom, 30)
                    
                    // Action Button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showHomeView = true
                        }
                    }) {
                        HStack {
                            Text("Commencer l'aventure")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: AppConstants.buttonHeight)
                        .background(destinations[currentIndex].accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.cornerRadius))
                        .shadow(color: .white.opacity(0.2), radius: 10, x: 0, y: 5)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 50)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
                .opacity(isAnimating ? 1 : 0)
                .animation(
                    .easeInOut(duration: AppConstants.animationDuration),
                    value: isAnimating
                )
            }
            .navigationDestination(isPresented: $showHomeView) {
                TabBar()
            }
            .navigationBarHidden(true)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isAnimating = true
                }
            }
            .statusBar(hidden: true)
        }
    }
    
    private func setupAutoScroll() {
        Timer.scheduledTimer(withTimeInterval: AppConstants.autoScrollInterval, repeats: true) { _ in
            withAnimation(.easeInOut(duration: AppConstants.animationDuration)) {
                currentIndex = (currentIndex + 1) % destinations.count
            }
        }
    }
}

// MARK: - Custom Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.light)
    }
}
#Preview {
    OnboardingView()
        .preferredColorScheme(.light)
}
