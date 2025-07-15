//
//  GetStarted.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import SwiftUI

struct GetStarted: View {
    @State var showLoginPage: Bool = false
    struct text {
        let title = """
Discover Chad – where vibrant culture, 
stunning beauty, and extraordinary 
wonders come together.
"""
    let subtitle = """
    Explore tourist attractions
        start your journey now!
"""
    }
    var body: some View {
     
        VStack(alignment: .center,spacing: 30){
            
            ScrollView(.vertical,showsIndicators: false){
              
                    Image("go2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            
            
                Text(text().title).textScale(.default).fontWeight(.bold).foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(text().subtitle).foregroundColor(.black)
                
     
                Button{
                   showLoginPage = true
                }label: {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .padding(.vertical,15)
                        .frame(maxWidth: 300)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    
                       
                      
                }.offset(y:70)
                
                
             
                Spacer()
           
                
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color(hex: "29aa96").opacity(0.4))
            .overlay(
                Group{
                    if showLoginPage {
                        LoginPage()
                        
                            .transition(.move(edge: .bottom))
                    }
                }
            )
       
    
    }
}
#Preview {
    GetStarted()
}



