//
//  Home.swift
//  TchadGo
//
//  Created by Amir hissein on 2.07.2025.
//

import SwiftUI

struct Home: View {
    @State var locationShow = false
    @State var UserShow = false
    @FocusState var FocusKeyboard: Bool
    let username: String
  @State var searchText: String = ""
    var body: some View {
        
        // sectıon de home
        NavigationStack {
           
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Button(action: {
                        self.locationShow.toggle()
                    }){
                        Image( systemName: "location.viewfinder").font(.title).foregroundColor(.gray)
                    }.sheet(isPresented: $locationShow) {
                        // sheet permet la sortit d une fenetre
                        Location()
                    }
                    Spacer()
                    
                    Button(action: {
                        self.UserShow.toggle()
                        UserShow = true
                    }){
                        Image( systemName: "person.circle.fill").font(.largeTitle).foregroundColor(.gray)
                    }.sheet(isPresented: $UserShow) {
                        // sheet permet la sortit d une fenetre
                        LoginView(loggedInUser: .constant(nil))// Version
                    }
                }
                    HStack{
                        Text("🌟 Bienvenue, \(username)!")
                            .font(.title2)
                            .padding(.leading, 20)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                //section du texte
                Text("Discover your destination!").fontWeight(.heavy).font(.largeTitle).padding(.top,15)
                   SearchBar()
                    //section du texte de boutton horizontal
                    HStack{
                        Button(action: {
                            
                        }){
                            Text("Experience").foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            
                        }){
                            Text("Adventure").foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            
                        }){
                            Text("Activities").foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            
                        }){
                            Text("Flay").foregroundColor(.gray)
                        }
                    }.padding([.top],30)
                        .padding([.bottom],15)
                    MidleView()
                    BottomView().padding(.bottom,20)
                }.padding()
            }
        }
    }




#Preview {
    Home( username: "User")
}
