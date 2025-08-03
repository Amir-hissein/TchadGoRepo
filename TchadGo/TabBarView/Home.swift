//
//  Home.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct Home: View {
    // MARK: - States
    @State private var locationShow = false
    @State private var userShow = false
    @FocusState private var isKeyboardFocused: Bool
    @State private var searchText: String = ""

    let username: String
    private let titleText = """
    Discover
    your destination!
    """

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {

                // MARK: - Top Bar Buttons
                HStack {
                    // Location button
                    Button(action: {
                        locationShow.toggle()}) {
                        Image(systemName: "location.viewfinder")
                            .font(.title2)
                    }
                    .sheet(isPresented: $locationShow) {
                        Text("Location Sheet")
                            .font(.headline)
                            .padding()
                    }

                    Spacer()

                    // User profile button
                    Button(action: {userShow.toggle()}) {Image(systemName: "person.circle").font(.title)}
                    .sheet(isPresented: $userShow) {
                        LoginPage()
                    }
                }

                // MARK: - Title Text
                Text(titleText)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.top, 15)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Home(username: "User")
}
