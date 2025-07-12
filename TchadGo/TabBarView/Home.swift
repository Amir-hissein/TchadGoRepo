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
    let text = """
    Discover 
    your destination!
    """
  @State var searchText: String = ""
    var body: some View {
        
        // sectıon de home
        NavigationStack {
           
          
                
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Button(action: {
                            self.locationShow.toggle()
                        }){
                            Image( systemName: "location.viewfinder").font(.title2)
                        }.sheet(isPresented: $locationShow) {
                            // sheet permet la sortit d une fenetre
              Location()
                        }
                        Spacer()
                        
                        Button(action: {
                            self.UserShow.toggle()
                            UserShow = true
                        }){
                            Image( systemName: "person.circle").font(.title)
                        }.sheet(isPresented: $UserShow) {
                            // sheet permet la sortit d une fenetre
                            LoginView(loggedInUser: .constant(nil))// Version
                        }
                    }
                   

                    //section du texte
                   
                        Text(text).fontWeight(.heavy).font(.title).padding(.top,15)
                    Location()
                        //section du texte de boutton horizontal
                        MidleView()
                    Spacer()
                      
                    Spacer()
                        BottomView().padding(.bottom,40)
                    Spacer()
                    }.padding()
                }
            }
        }
    




#Preview {
    Home( username: "User")
}
