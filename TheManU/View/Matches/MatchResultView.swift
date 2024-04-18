//
//  MatchResultView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/12/24.
//

import SwiftUI

struct MatchResultView: View {
    @State var isDataLoaded = false
    @State var isShowSheet = false
    @State var selectedIndex: Int = 0
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
                
                NavigationLink {
                    DiaryListView()
                } label: {
                    Image(systemName: "doc.plaintext")
                }
                
                Spacer()
            }
            
            ScrollView {
                VStack {
                    ForEach(0..<(viewModel.matchResult?.date.count ?? 0), id: \.self) { index in
                        MatchesResultBtn(date: viewModel.matchResult?.date[index] ?? "", goal: viewModel.matchResult?.goal[index] ?? "", league: viewModel.matchResult?.leage[index] ?? "", imageName: viewModel.matchResult?.enemy[index] ?? "", matchTeam: viewModel.matchResult?.enemy[index] ?? "", action: {
                            selectedIndex = index
                            isShowSheet = true
                        })
                        .padding()
                        .sheet(isPresented: $isShowSheet, content: {
                            DiaryView(matchResult: viewModel.matchResult!, isShowSheet: $isShowSheet, selectedIndex: $selectedIndex)
                        })
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
