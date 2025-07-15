//
//  TchadGoApp.swift
//  TchadGo
//
//  Created by Amir hissein on 28.06.2025.
import SwiftUI
import SwiftData

@main
struct TchadGoApp: App {
    @StateObject private var networkMonitor = NetworkMonitor.shared
    @StateObject private var appState = AppState() // Nouvel état global
    
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
           GetStarted()
           
        }
        .modelContainer(sharedModelContainer)
    }
}
// Nouvelle classe pour gérer l'état de l'application

class AppState: ObservableObject {
    @Published var shouldShowOnboarding: Bool
    
    init() {
        let wasTerminated = UserDefaults.standard.bool(forKey: "wasAppTerminated")
        let firstLaunch = !UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
        
        shouldShowOnboarding = firstLaunch || wasTerminated
    }
    
    func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        UserDefaults.standard.set(false, forKey: "wasAppTerminated")
        shouldShowOnboarding = false
    }
}

