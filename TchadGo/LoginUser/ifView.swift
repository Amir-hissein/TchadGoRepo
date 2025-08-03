//
//  ifView.swift
//  TchadGo
//
//  Created by Amir hissein on 16.07.2025.
//

import SwiftUI

struct IfView: View {
    @State private var showSuccessAnimation = false

    var body: some View {
        VStack(spacing: 10) {
            if showSuccessAnimation {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)
                    .transition(.scale)
                    .animation(.easeInOut(duration: 0.4), value: showSuccessAnimation)

                Text("Email sent successfully!")
                    .font(.headline)
                    .foregroundColor(.green)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.4), value: showSuccessAnimation)
            }
        }
        .onAppear {
            showSuccessAnimation = true
        }
        .padding(.top)
    }
}

#Preview {
    IfView()
}
