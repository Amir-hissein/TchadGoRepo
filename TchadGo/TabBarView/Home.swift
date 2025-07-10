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
           
            ZStack{
                //Color.init(Color(hex: "29aa96").opacity(0.3)).ignoresSafeArea()
                VStack{
                    Rectangle()
                        .fill(Color.init(Color(hex: "29aa96")))
                        .frame(width: 450, height: 200)
                        .offset(y:-380)
                        .padding(.horizontal,-35)
                       
                } 
                
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Button(action: {
                            self.locationShow.toggle()
                        }){
                            Image( systemName: "location.viewfinder").font(.title2).foregroundColor(.white)
                        }.sheet(isPresented: $locationShow) {
                            // sheet permet la sortit d une fenetre
                            Location()
                        }
                        Spacer()
                        
                        Button(action: {
                            self.UserShow.toggle()
                            UserShow = true
                        }){
                            Image( systemName: "line.3.horizontal.decrease").font(.title2).foregroundColor(.white)
                        }.sheet(isPresented: $UserShow) {
                            // sheet permet la sortit d une fenetre
                            LoginView(loggedInUser: .constant(nil))// Version
                        }
                    }
                    VStack(alignment: .leading, spacing: 12){
                        HStack{
                            Text("🌟 Bienvenue, \(username)!")
                                .font(.title2)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                        
                    //section du texte
                   
                        Text("Discover your destination!").fontWeight(.heavy).font(.title).padding(.top,15)
                       SearchBar()
                        //section du texte de boutton horizontal
                        MidleView()
                    Spacer()
                        BottomView().padding(.bottom,40)
                    Spacer()
                    }.padding()
                }
            }
        }
    }




#Preview {
    Home( username: "User")
}
