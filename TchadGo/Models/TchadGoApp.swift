//
//  TchadGoApp.swift
//  TchadGo
//
//  Created by Amir hissein on 28.06.2025.
//

import SwiftUI
import SwiftData

@main
struct TchadGoApp: App {
    @StateObject private var networkMonitor = NetworkMonitor.shared

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabbarView()
                .environmentObject(networkMonitor)
        }
        .modelContainer(sharedModelContainer)
    }
}
