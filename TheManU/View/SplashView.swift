//
//  SplashView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/9/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MatchesView()
        } else {
            Image("splash")
                .resizable()
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isActive = true
                    }
                }
        }
    }
}

#Preview {
    SplashView()
}
