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
            Image("cover")
                .resizable()
                .scaledToFit()
            
            HStack {
                Text("Matches")
                    .font(Font.system(size: 25, weight: .bold))
                    .padding()
                Spacer()
            }
            
            ScrollView {
                VStack {
                    
                    
                    ForEach(0..<(viewModel.matchup?.date.count ?? 0), id: \.self) { index in
                        MatchesBtn(/*ym: viewModel.matchup?.YM[index] ?? "April 2024",*/ date: viewModel.matchup?.date[index] ?? "Saturday 13th April", matchTime: viewModel.matchup?.time[index] ?? "15:30", league: viewModel.matchup?.leage[index] ?? "Premier League", enemies: viewModel.matchup?.enemy[index] ?? "Bournemouth", action: {})
                            .padding()
                    }
                }
            }
            .background(
                Image("manutd")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .opacity(0.1))
            .onAppear {
                if !isDataLoaded {
                    viewModel.fetchMatchResult()
                    viewModel.fetchMatchup()
                    isDataLoaded = true
                }
            }
        }
    }
}

#Preview {
    MatchesView()
}
