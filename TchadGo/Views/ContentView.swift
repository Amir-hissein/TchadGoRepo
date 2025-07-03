//
//  ContentView.swift
//  TchadGo
//
//  Created by Amir hissein on 28.06.2025.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            Text("Recherche")
                .font(.title2.bold())

            TextField("Tape ici...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($isFocused)

            Spacer()
        }
        .onAppear {
            // Activer le clavier automatiquement
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isFocused = true
            }
        }
        .onTapGesture {
            hideKeyboard()
            isFocused = false // Pour cacher le clavier
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
