//
//  StartView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 5){
            Image(systemName: "location.north.fill")
                Text("Amirco hissein").foregroundColor(.gray)
            }
            HStack(spacing: 8) {
                ForEach(0..<5){_ in
                    Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                }
            }
            Text("People").fontWeight(.heavy)
            Text("Number of People in your Group")
            
            HStack(spacing: 8){
                ForEach(0..<5) {i in
                    Button(action: {
                        
                    }){
                        Text("\(i + 1)").foregroundColor(.white).padding(20)
                    }.background(.gray).opacity(0.4)
                        .cornerRadius(10)
                    
                }
            }
            
        }.padding(.horizontal, 15)
    }
}


#Preview {
    StartView()
}
