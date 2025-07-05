//
//  MidleView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct MidleView: View {
    @State var show = false
    var body: some View {
        //section des image et scrolle view de boutton horizontal
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    VStack(alignment: .leading,spacing: 5){
                        Button(action: {
                            
                        }){
                            Image("logo1").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                
                               
                        }
                        Text("tchad Time").fontWeight(.heavy)
                        HStack(spacing: 5){
                            Image(systemName: "map")
                            Text("Vancouver, CA").foregroundColor(.gray)
                        }
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Button(action: {
                            //pour faire un appelle a l state
                            self.show.toggle()
                        }){
                            Image("Chad").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                        }
                        Text("tchad Time").fontWeight(.heavy)
                        HStack(spacing: 5){
                            Image(systemName: "map")
                            Text("Vancouver, CA").foregroundColor(.gray)
                        }
                    }
                    
                    VStack(alignment: .leading,spacing: 5){
                        Button(action: {
                            
                        }){
                            Image("Chad").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                        }
                        Text("tchad Time").fontWeight(.heavy)
                        HStack(spacing: 5){
                            Image(systemName: "map")
                            Text("Vancouver, CA").foregroundColor(.gray)
                        }
                    }
                    
                    VStack(alignment: .leading,spacing: 5){
                        Button(action: {
                            
                        }){
                            Image("Chad").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                        }
                        Text("tchad Time").fontWeight(.heavy)
                        HStack(spacing: 5){
                            Image(systemName: "map")
                            Text("Vancouver, CA").foregroundColor(.gray)
                        }
                    }
                    
                    //fin de section des image et des bouttons
                }
            }.padding()
                .background(.white)
                .cornerRadius(20)
        }.sheet(isPresented: $show) {
            // sheet permet la sortit d une fenetre 
            Detail()
        }
    }
}

#Preview {
    MidleView()
}
