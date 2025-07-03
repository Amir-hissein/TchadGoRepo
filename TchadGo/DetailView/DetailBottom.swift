//
//  DetailBottom.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct DetailBottom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .fontWeight(.heavy)
            Text("forest camping experience de and amning keys element of expereience imnclude nature, social interaction and confort conenienge. the most coomon associated meanings are restoration familly fonctionning").foregroundColor(.gray)
            
            HStack(spacing: 8){
                Button(action: {
                    
                }){
                    Image(systemName: "append.page.fill")
                        .font(.title)
                        .foregroundColor(Color(hex: "29aa96"))
                        .padding(5)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    
                }){
                    HStack(spacing: 6){
                        Text("Book your experience").foregroundColor(.black)
                        Image(systemName: "inset.filled.righthalf.arrow.right.rectangle")
                            .font(.title)
                            .foregroundColor(Color(hex: "29aa96"))
                            .padding(5)
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                        
                    }.foregroundColor(.white)
                       
                }.padding(5)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
            }.padding(.top,15)
        }.padding()
    }
}

#Preview {
    DetailBottom()
}
