//
//  DetailBottom.swift
//  TchadGo
//
//  Created by Amir Hissein on 2.07.2025.
//

import SwiftUI

struct DetailBottom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Titre
            Text("Description")
                .fontWeight(.heavy)

            // Texte de description
            Text("""
                Forest camping experience and the amazing key elements \
                include nature, social interaction, and comfort. \
                The most common associated meanings are restoration, \
                family functioning, and convenience.
                """)
                .foregroundColor(.gray)

            // Boutons d’action
            HStack(spacing: 8) {
                // Bouton icône simple
                Button(action: {
                  }){
                    Image(systemName: "append.page.fill")
                        .font(.title)
                        .foregroundColor(Color(hex: "29aa96"))
                        .padding(5)
                        .background(.ultraThinMaterial)
                }

                // Bouton avec texte + icône
                Button(action: {
                    }) {
                    HStack(spacing: 6) {
                        Text("Book your experience")
                            .foregroundColor(.black)

                        Image(systemName: "inset.filled.righthalf.arrow.right.rectangle")
                            .font(.title)
                            .foregroundColor(Color(hex: "29aa96"))
                            .padding(5)
                            .background(.ultraThinMaterial)
                    }
                }
                .padding(5)
                .background(.ultraThinMaterial)
            }
            .padding(.top, 15)
        }
        .padding()
    }
}

#Preview {
    DetailBottom()
}
