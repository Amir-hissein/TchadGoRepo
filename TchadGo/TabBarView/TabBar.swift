//
//  TabView.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack{
            TabView {
                Home().tabItem{
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
              
        }
        
    }
}

#Preview {
    TabBar()
}
