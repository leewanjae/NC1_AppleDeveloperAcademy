//
//  MatchesView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import SwiftUI

struct MatchesView: View {
    @StateObject var viewModel = MatchesVM()
    
    var body: some View {
        VStack {
            Text(viewModel.matchup?.YM[0] ?? "")
        }
        .background(
            Image("manutd")
            .resizable()
            .frame(width: 300, height: 300)
            .opacity(0.1))
        .onAppear {
            DispatchQueue.main.async {
                viewModel.fetchMatchup()
                viewModel.fetchMatchResult()
            }
        }
    }
}

#Preview {
    MatchesView()
}
