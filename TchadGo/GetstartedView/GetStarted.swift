//
//  GetStarted.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import SwiftUI

struct GetStarted: View {
    @State var GetShow: Bool = false
    @State private var offsetX: CGFloat = -200
    @State private var opacity: Double = 0.5
    //BACK BUTTON
   
    var body: some View {
            NavigationStack{
                    VStack {
                        VStack{
                            Image("logo1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height*1/3)
                                .cornerRadius(30)
                                .scaledToFit()
                                .offset(x: offsetX)
                                .opacity(opacity)
                                .animation(.easeInOut(duration: 0.5), value:  offsetX)
                                .animation(.easeInOut(duration: 0.5), value:  opacity)
                                .onAppear{
                                    offsetX = 0
                                    opacity = 1
                                }
                        }
                        Spacer()
                      
                        VStack(alignment: .center ,spacing: 20){
                            Text("Discover Chad – where vibrant culture, stunning beauty, and extraordinary wonders come together.")
                                .fontWeight(.heavy)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding()
                               
                         
                            Text("Explore tourist attractions start your journey now!")
                                .fontWeight(.medium)
                                .font(.system(size: 15, weight: .heavy, design: .default))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(TextAlignment.center)
               
                        }
                        
                        Spacer()
                 
                        HStack(spacing:10){
                            
                            Button(action: {
                                withAnimation(.easeIn) {
                                    GetShow = true
                                }
                            }){
                                Text("Get Started   ")
                                Image(systemName: "arrow.right")
                                    
                                
                            }.fontWeight(.medium)
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width*0.8, height: 50)
                                .background(Color.init(hex: "29aa96"))
                                .cornerRadius(20)
                                
                        }.navigationDestination(isPresented: $GetShow){
                            TabBar()
                                
                         // --section de boutton de retoure
                        }
                        Spacer()
                   
            }.padding()
                
                
                }
       
        
            }
    
        }
     
        
  



#Preview {
    GetStarted()
}
