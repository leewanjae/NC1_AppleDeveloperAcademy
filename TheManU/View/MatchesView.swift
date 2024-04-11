//
//  MatchesView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import SwiftUI

struct MatchesView: View {
    @State private var isDataLoaded = false
    @StateObject var viewModel = MatchesVM()
    
    var body: some View {
        VStack {
            HStack {
                Text("Matches")
                    .font(Font.system(size: 25, weight: .bold))
                    .padding()
                
                Spacer()
            }
            MatchesBtn(ym: viewModel.matchup?.YM[0] ?? "April 2024", date: viewModel.matchup?.date[0] ?? "Saturday 13th April", matchTime: viewModel.matchup?.time[0] ?? "15:30", league: viewModel.matchup?.leage[0] ?? "Premier League", enemies: viewModel.matchup?.enemy[0] ?? "Bournemouth", action: {})
        }
        .background(
            Image("manutd")
                .resizable()
                .frame(width: 300, height: 300)
                .opacity(0.1))
        .onAppear {
//            if !isDataLoaded {
//                viewModel.fetchMatchResult()
//                viewModel.fetchMatchup()
//                isDataLoaded = true
//            }
        }
    }
}

#Preview {
    MatchesView()
}
