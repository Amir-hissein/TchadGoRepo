//
//  NetworkMonitor.swift
//  TchadGo
//
//  Created by Amir hissein on 5.07.2025.
//
import Foundation
import Network
import Combine

class NetworkMonitor: ObservableObject {
    static let shared = NetworkMonitor()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    private var autoReconnectMonitor: NWPathMonitor?

    @Published var isConnected: Bool = true
    @Published var isConnectionConstrained: Bool = false
    @Published var isExpensive: Bool = false
    @Published var connectionType: String = "unknown"

    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.updateStatus(path: path)
        }
        monitor.start(queue: queue)
    }

    private func updateStatus(path: NWPath) {
        DispatchQueue.main.async {
            self.isConnected = path.status == .satisfied
            self.isConnectionConstrained = path.isConstrained
            self.isExpensive = path.isExpensive
            self.connectionType = self.getConnectionType(from: path)
        }
    }

    func checkConnection() {
        let newMonitor = NWPathMonitor()
        newMonitor.pathUpdateHandler = { [weak self] path in
            self?.updateStatus(path: path)
        }
        newMonitor.start(queue: queue)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            newMonitor.cancel()
        }
    }

    func startAutoReconnectCheck() {
        autoReconnectMonitor?.cancel()
        autoReconnectMonitor = NWPathMonitor()
        autoReconnectMonitor?.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.updateStatus(path: path)
                    self?.autoReconnectMonitor?.cancel()
                    self?.autoReconnectMonitor = nil
                }
            }
        }
        autoReconnectMonitor?.start(queue: queue)
    }

    private func getConnectionType(from path: NWPath) -> String {
        if path.usesInterfaceType(.wifi) {
            return "WiFi"
        } else if path.usesInterfaceType(.cellular) {
            return "Cellulaire"
        } else if path.usesInterfaceType(.wiredEthernet) {
            return "Ethernet"
        } else {
            return "Inconnu"
        }
    }
}
