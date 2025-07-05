//
//  TabView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct TabBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            TabView {
                Home(username: "user").tabItem{
                    Image( systemName: "house")
                        .resizable()
                        .font(.largeTitle)
                        
                }
                Text("Activity").tabItem{
                    Image(systemName: "heart.fill").font(.title)
                   
                    
                }
                Text("Activity").tabItem{
                    Image(systemName: "matter.logo").font(.title)
                    
                    
                }
                Text("setting").tabItem{
                    Image(systemName: "person").font(.title)
                    
                    
                }
            }
              
        }.navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                
                            
                            
                        }
                    }
                }
            }
        
    }
}

#Preview {
    TabBar()
}
