//
//  MatchesView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import SwiftUI

struct MatchesView: View {
    @State private var isDataLoaded = false
    @State private var isShowSheet = false
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
                
                NavigationLink {
                    DiaryListView()
                } label: {
                    Image(systemName: "doc.plaintext")
                }
                
                Spacer()
            }
            
            ScrollView {
                VStack {
                    ForEach(0..<(viewModel.matchup?.date.count ?? 0), id: \.self) { index in
                        MatchesBtn(date: viewModel.matchup?.date[index] ?? "", matchTime: viewModel.matchup?.time[index] ?? "", league: viewModel.matchup?.leage[index] ?? "", imageName: viewModel.matchup?.enemy[index] ?? "", enemies: viewModel.matchup?.enemy[index] ?? "", action: {
                            isShowSheet = true
                        })
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
