//
//  BottomView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct BottomView: View {
    
    var body: some View {
   
 
            VStack {
                HStack{
                    Text("What you want?").fontWeight(.heavy)
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("View all").foregroundColor(.gray)
                    }
                }.padding([.top],15)
                
                // scetion des scrolleViw des different bouttons d orientation
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 35){
                        VStack(spacing: 8){
                            Button(action: {
                                
                            }){
                                
                                VStack(spacing:8) {
                                    Image(systemName: "location.north.circle.fill").font(.largeTitle)
                                        .foregroundColor(Color(hex: "29aa96"))
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                }
                                
                            }
                            Text("My location").foregroundColor(.gray)
                            
                            
                        }
                        
                        VStack(spacing: 8){
                            Button(action: {
                                
                            }){
                                VStack(spacing:8) {
                                    Image(systemName: "location.north.circle.fill").font(.largeTitle)
                                        .foregroundColor(Color(hex: "29aa96"))
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                }
                                
                            }
                            Text("Flight").foregroundColor(.gray)
                            
                            
                        }
                        
                        VStack(spacing: 8){
                            Button(action: {
                                
                            }){
                                VStack(spacing:8) {
                                    Image(systemName: "location.north.circle.fill").font(.largeTitle)
                                        .foregroundColor(Color(hex: "29aa96"))
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                }
                                
                            }
                            Text("Hotels").foregroundColor(.gray)
                            
                            
                        }
                        
                        VStack(spacing: 8){
                            Button(action: {
                                
                            }){
                                VStack(spacing:8) {
                                    Image(systemName: "location.north.circle.fill").font(.largeTitle)
                                        .foregroundColor(Color(hex: "29aa96"))
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                }
                                
                            }
                            Text("My location").foregroundColor(.gray)
                            
                            
                        }
                    }
                }.padding(.leading, 10)
                    .padding([.top,.bottom],15)
            }
        }
    }


#Preview {
    BottomView()
}
