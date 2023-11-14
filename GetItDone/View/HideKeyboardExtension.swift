//
//  HideKeyboardExtension.swift
//  GetItDone
//
//  Created by Lexter Tapawan on 14/11/2023.
//

import SwiftUI

#if canImport(UIKey)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
