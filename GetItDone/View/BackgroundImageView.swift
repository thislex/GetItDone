//
//  BackgroundImageView.swift
//  GetItDone
//
//  Created by Lexter Tapawan on 14/11/2023.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFit()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
