//
//  KeyborardExtension.swift
//  TchadGo
//
//  Created by Amir hissein on 3.07.2025.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}




       
