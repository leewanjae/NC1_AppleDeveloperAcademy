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
        .onAppear {
            viewModel.fetchMatchup()
            viewModel.fetchMatchResult()
        }
    }
}

#Preview {
    MatchesView()
}
