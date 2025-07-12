//
//  LikedImageView.swift
//  TchadGo
//
//  Created by Amir hissein on 10.07.2025.
//


import SwiftUI

struct LikedImagesView: View {
    @Binding var likedPlaces: [Int: Bool]
    let totalCount: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                if likedPlaces.filter({ $0.value }).isEmpty {
                    emptyStateView
                } else {
                    likedImagesList
                }
            }
            .navigationTitle("Mes Favoris")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "heart.slash")
                .font(.system(size: 60))
                .foregroundColor(.gray.opacity(0.5))
            
            Text("Aucune image likée")
                .foregroundColor(.gray)
            
            Button(action: { dismiss() }) {
                Label("Ajouter des images", systemImage: "plus")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            
            Spacer()
        }
    }
    
    private var likedImagesList: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<totalCount, id: \.self) { index in
                    if likedPlaces[index] == true {
                        VStack(spacing: 8) {
                            ZStack(alignment: .topTrailing) {
                                Image("desert")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 180)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                
                                Button(action: {
                                    withAnimation {
                                        likedPlaces[index] = false
                                    }
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                        .padding(10)
                                        .background(Color.white.opacity(0.8))
                                        .clipShape(Circle())
                                }
                                .padding(16)
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Tchad Time")
                                    .font(.headline)
                                HStack {
                                    Image(systemName: "map")
                                    Text("Vancouver, CA")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
    
    private var backButton: some View {
        Button(action: { dismiss() }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color(hex: "29aa96"))
                Text("Retour")
                    .foregroundColor(Color(hex: "29aa96"))
            }
        }
    }
}

#Preview {
    LikedImagesView(likedPlaces: .constant([0: true, 1: true]), totalCount: 1)
}
