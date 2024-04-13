//
//  MatchResultView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/12/24.
//

import SwiftUI

struct MatchResultView: View {
    @State private var isDataLoaded = false
    @StateObject var viewModel = MatchesVM()
    
    var body: some View {
        VStack {
            Image("cover")
                .resizable()
                .scaledToFit()
            
            HStack {
                Text("Results")
                    .font(Font.system(size: 25, weight: .bold))
                    .padding()
                Spacer()
            }
            ScrollView {
                VStack {
                    
                    ForEach(0..<(viewModel.matchResult?.date.count ?? 0), id: \.self) { index in
                        MatchesResultBtn(date: viewModel.matchResult?.date[index] ?? "", goal: viewModel.matchResult?.goal[index] ?? "", league: viewModel.matchResult?.leage[index] ?? "", matchTeam: viewModel.matchResult?.enemy[index] ?? "", action: {})
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
                    isDataLoaded = true
                }
            }
        }
    }
}

#Preview {
    MatchResultView()
}
