//
//  SearchBar.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import SwiftUI

struct SearchBar: View {
  
    @State private var searchText = ""
    @FocusState var isFocused : Bool
    	
    var body: some View {
        NavigationStack {
            
            HStack{
                HStack{
                    VStack {
                        TextField("Search", text: $searchText)
                            .focused($isFocused)
                            .autocorrectionDisabled(true)
                            .disableAutocorrection(true)
                    }.padding(15)
                        .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .shadow(color:.gray .opacity(0.1), radius: 2, x: 0, y: 2)
                    VStack (spacing:13){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }.padding(15)
                        .background(Color(hex: "29aa96"))
                            .cornerRadius(10)
                            .shadow(color:.gray .opacity(0.1), radius: 2, x: 0, y: 2)
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }   .onTapGesture {
                            searchText = ""
                            isFocused = false
                            hideKeyboard() // ⌨️ cache le clavier quand on clique ailleurs
                        }
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                isFocused = true
                                hideKeyboard()
                            }
                            )
                        }
                        
                        
                    }
                    
                }
                
                
            }
            
                
        }
            
}
}

#Preview {
 SearchBar()

}

