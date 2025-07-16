//
//  ifView.swift
//  TchadGo
//
//  Created by Amir hissein on 16.07.2025.
//

import SwiftUI

struct ifView: View {
    @State private var showSuccessAnimation = false
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
                .transition(.scale)
                .animation(.easeInOut(duration: 0.4), value: showSuccessAnimation)

            Text("Email sent successfully!")
                .font(.headline)
                .foregroundColor(.green)
        }
        .padding(.top)
        }
    }
#Preview {
    ifView()
}
