//
//  GetStarted.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import SwiftUI

struct GetStarted: View {
    @State private var showLoginPage = false
    @State private var animateTitle = false
    @State private var animateSubtitle = false
    @State private var animateButton = false

    struct TextContent {
        static let title = """
        Discover Chad – where vibrant culture, 
        stunning beauty, and extraordinary \
        wonders come together.
        """

        static let subtitle = """
        Explore tourist attractions, 
        start your journey now!
        """
    }

    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            ZStack {
                Image("go6")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()

                LinearGradient(
                    colors: [
                        Color.blue,
                        Color.green.opacity(0.2),
                        Color.white.opacity(0.4)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .offset(y: -70)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)
                .blur(radius: 3)

                Circle()
                    .strokeBorder(Color.white)
                    .frame(width: 30, height: 30)
                    .blur(radius: 3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(30)

                Circle()
                    .strokeBorder(Color.white)
                    .frame(width: 23, height: 23)
                    .blur(radius: 3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(30)
            }

            VStack(spacing: 30) {
                Text(TextContent.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .opacity(animateTitle ? 1 : 0)
                    .offset(y: animateTitle ? 0 : -20)
                    .animation(.easeOut(duration: 0.6), value: animateTitle)

                Text(TextContent.subtitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .opacity(animateSubtitle ? 1 : 0)
                    .offset(y: animateSubtitle ? 0 : -15)
                    .animation(.easeOut(duration: 0.6).delay(0.3), value: animateSubtitle)

                Button {
                    showLoginPage = true
                } label: {
                    Text("Get Started")
                        .padding(.vertical, 15)
                        .frame(maxWidth: 350)
                        .foregroundColor(.white)
                        .background(Color(hex: "29aa96"))
                        .cornerRadius(10)
                }
                .scaleEffect(animateButton ? 1 : 0.8)
                .opacity(animateButton ? 1 : 0)
                .offset(y: animateButton ? 0 : 30)
                .animation(
                    .spring(response: 0.5, dampingFraction: 0.7).delay(0.6),
                    value: animateButton
                )
            }

            Spacer()

            Circle()
                .strokeBorder(Color.white)
                .frame(width: 50, height: 50)
                .blur(radius: 3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            animateTitle = true
            animateSubtitle = true
            animateButton = true
        }
        .overlay(
            Group {
                if showLoginPage {
                    TabbarView()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

#Preview {
    GetStarted()
}
