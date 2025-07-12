//
//  Location.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//


import SwiftUI

struct Location: View {
    let images = ["logo", "cart", "desert", "logo1", "desert"]

        @State private var selectedIndex = 0
        
        var body: some View {
            VStack {
                // 🔥 Le carrousel principal
          
                    TabView(selection: $selectedIndex) {
                        ForEach(images.indices, id: \.self) { index in
                            ZStack {
                                Image(images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 400)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 6)
                            }
                            .padding(.horizontal, 32)
                            .tag(index)
                        }
                    }
                    .frame(height: 230)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                } // 🚫 cache les points natifs
                
                // ⚪ Points indicateurs personnalisés
                HStack(spacing: 8) {
                    ForEach(images.indices, id: \.self) { index in
                        Circle()
                            .fill(index == selectedIndex ? .white : .gray.opacity(0.5))
                            .frame(width: 5, height: 10)
                            .scaleEffect(index == selectedIndex ? 1.2 : 1.0)
                            .animation(.easeInOut(duration: 0.3), value: selectedIndex)
                    }.padding(.top,-50)
                
                }
                .padding(.top, 10)
            }
           
        }


#Preview {
    Location()
}
