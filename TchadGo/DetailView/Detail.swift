//
//  Detail.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct Detail: View {
   
    var body: some View {
        VStack{
            Image("desert").resizable().aspectRatio(1.35, contentMode: .fill)
                .frame(width:UIScreen.main.bounds.width, height: 500)
                .offset(y: -200)
                .padding(.bottom,-200)
            GeometryReader{geo in
                VStack(alignment: .leading){
                   DetailTopView()
                   StartView()
                    DetailBottom()
                    
                }
                
            }.background(Color.white)
                .clipShape(Rounded())
                .padding(.top,-75)
                

        }
        
    }
}

//une structure pour ajouter la place blanc
struct Rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 50))
        return Path(path.cgPath)
    }
}
#Preview {
    Detail()
}
