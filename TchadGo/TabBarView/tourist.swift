//
//  tourist.swift
//  TchadGo
//
//  Created by Amir hissein on 10.07.2025.
//
import SwiftUI

struct MainTouristView: View {
    @State private var showDetailView = false
    
    var body: some View {
       
        NavigationStack {
            ZStack {
                
                HStack {
                    Rectangle()
                        .fill(Color(hex: "29aa96"))
                        .frame(maxWidth: .infinity,maxHeight: 200)
                        .edgesIgnoringSafeArea(.all)
                }.padding(.bottom, UIScreen.main.bounds.height*0.7)
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        
                        // Bouton Filtre
                        Button(action: {
                            print("Filtrage lancé")
                        }) {
                            IconButtonView(systemName: "line.3.horizontal.decrease.circle")
                        }
                        
                        // Bouton Favoris
                        Spacer()
                        
                        // Bouton Navigation
                        Button(action: {
                            showDetailView = true
                        }) {
                            IconButtonView(systemName: "eye")
                        }
                        .navigationDestination(isPresented: $showDetailView) {
                            DetailTouristView()
                        }
                        
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                
            }
        }
           
        }
    }


struct IconButtonView: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
            .padding()
          
        
    }
}

struct DetailTouristView: View {
    var body: some View {
        VStack {
            Text("Vue Détail des Lieux")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Détail")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}


#Preview {
    MainTouristView()
}
