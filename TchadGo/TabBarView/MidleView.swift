//
//  MidleView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct MidleView: View {
    @State private var showDetail = false
    @State private var likedPlaces: [Int: Bool] = [:]
    @State private var showAll = false
    

    let imageCount = 4

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Découverte")
                        .font(.title2)
                        .fontWeight(.bold)

                    Spacer()

                    Button(action: {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            showAll = true
                        }
                    }) {
                        Text("View All")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    .navigationDestination(isPresented: $showAll) {
                        AllImagesView(likedPlaces: $likedPlaces, count: imageCount)
                    }
                }
                .padding(.horizontal)

                ScrollView(.vertical,showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<imageCount, id: \.self) { index in
                                VStack(alignment: .leading, spacing: 5) {
                                    ZStack(alignment: .topTrailing) {
                                        Button {
                                            if index == 1 { showDetail = true }
                                        } label: {
                                            Image("desert")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 150, height: 120)
                                                .clipped()
                                                .cornerRadius(10)
                                                .shadow(radius: 3)
                                                .transition(.scale.combined(with: .opacity))
                                        }
                                        
                                        Button {
                                            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                                                likedPlaces[index] = !(likedPlaces[index] ?? false)
                                            }
                                        } label: {
                                            Image(systemName: likedPlaces[index] == true ? "heart.fill" : "heart")
                                                .foregroundColor(likedPlaces[index] == true ? Color.red.opacity(0.8) : .white)
                                                .padding(8)
                                                .background(Color.black.opacity(0.5))
                                                .clipShape(Circle())
                                                .scaleEffect(likedPlaces[index] == true ? 1.3 : 1.0)
                                                .font(.caption2)
                                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: likedPlaces[index])
                                        }
                                        .padding(10)
                                    }
                                    
                                    Text("Tchad Time")
                                        .fontWeight(.heavy)
                                    
                                    HStack(spacing: 5) {
                                        Image(systemName: "map")
                                        Text("Vancouver, CA")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .animation(.easeInOut(duration: 0.3), value: likedPlaces[index])
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                    }
                    .sheet(isPresented: $showDetail) {
                        Detail()
                    }
                }
            }
        }
    }
}

struct AllImagesView: View {
    @Binding var likedPlaces: [Int: Bool]
    let count: Int
    @Environment(\.dismiss) var dismiss

    @State private var appear: [Bool]

    // Initialisateur pour créer un tableau "appear" avec "count" valeurs à false
    init(likedPlaces: Binding<[Int: Bool]>, count: Int) {
        self._likedPlaces = likedPlaces
        self.count = count
        // initialise appear à false pour chaque élément
        self._appear = State(initialValue: Array(repeating: false, count: count))
    }

    var body: some View {
        ScrollView() {
            LazyVStack(spacing: 20) {
                ForEach(0..<count, id: \.self) { index in
                    ZStack(alignment: .topTrailing) {
                        Image("desert")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .opacity(appear[index] ? 1 : 0)
                            .offset(y: appear[index] ? 0 : 30)
                            .animation(.easeOut(duration: 0.6).delay(Double(index) * 0.15), value: appear[index])

                        Button {
                            withAnimation(.spring()) {
                                likedPlaces[index] = !(likedPlaces[index] ?? false)
                            }
                        } label: {
                            Image(systemName: likedPlaces[index] == true ? "heart.fill" : "heart")
                                .foregroundColor(likedPlaces[index] == true ? Color.red: .white)
                                .padding(10)
                                .background(Color.black.opacity(0.4))
                                .clipShape(Circle())
                                .scaleEffect(likedPlaces[index] == true ? 1.3 : 1.0)
                                .animation(.spring(), value: likedPlaces[index])
                        }
                        .padding(16)
                        .offset(x:-10)
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
                    .opacity(appear[index] ? 1 : 0)
                    .offset(y: appear[index] ? 0 : 30)
                    .animation(.easeOut(duration: 0.6).delay(Double(index) * 0.15), value: appear[index])
                }
            }
        }
        .navigationTitle("Tous les lieux")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(hex: "29aa96"))
                    }
                }
            }
        }
        .onAppear {
            for i in 0..<count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.15) {
                    appear[i] = true
                }
            }
        }
    }
}



#Preview {
    MidleView()
}
