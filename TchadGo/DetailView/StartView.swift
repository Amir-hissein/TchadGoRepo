//
//  StartView.swift
//  TchadGo
//
//  Created by Amir Hissein on 2.07.2025.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Localisation et nom
            HStack(spacing: 5) {
                Image(systemName: "location.north.fill")
                Text("Amirco Hissein")
                    .foregroundColor(.gray)
            }

            // Étoiles de notation
            HStack(spacing: 8) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundColor(.yellow)
                }
            }

            // Titre et description
            Text("People")
                .fontWeight(.heavy)

            Text("Number of people in your group")

            // Boutons 1 à 5
            HStack(spacing: 8) {
                ForEach(0..<5) { index in
                    Button(action: {
                    })
                    {
                        Text("\(index + 1)")
                            .foregroundColor(.blue)
                            .padding(20)
                    }
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    StartView()
}

