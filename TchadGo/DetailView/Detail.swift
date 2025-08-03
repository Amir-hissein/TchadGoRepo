//
//  Detail.swift
//  TchadGo
//
//  Created by Amir Hissein on 2.07.2025.
//

import SwiftUI

struct Detail: View {
    var body: some View {
        VStack {
            Image("go6")
                .resizable()
                .aspectRatio(1.35, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .offset(y: -150)
                .padding(.bottom, -200)

            GeometryReader { _ in
                VStack(alignment: .leading) {
                    DetailTopView()
                    StartView()
                    DetailBottom()
                }
            }
            .background(Color.white)
            .clipShape(Rounded())
            .padding(.top, -50)
        }
    }
}

/// Structure pour arrondir les coins supérieurs
struct Rounded: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 40, height: 50)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    Detail()
}
