//
//  DetailTopView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct DetailTopView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                VStack{
                    Text("desrt").fontWeight(.heavy).font(.largeTitle)
                    
                    
                }
                Spacer()
                
                Text("$250").foregroundColor(.gray).font(.largeTitle)
            }
            
        }.padding()
    }
}

#Preview {
    DetailTopView()
}
