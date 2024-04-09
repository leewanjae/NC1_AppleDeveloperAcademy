//
//  ContentView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import SwiftUI

struct MatchesView: View {
    @StateObject private var viewModel = MatchesVM()

    var body: some View {
        NavigationView {
            List(viewModel.matches) { match in
                VStack(alignment: .leading) {
                    Text("\(match.home) vs \(match.away)")
                        .fontWeight(.bold)
                    Text("Date: \(match.date)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Manchester United Matches")
            .onAppear {
                viewModel.fetchMatches()
            }
        }
    }
}

#Preview {
    MatchesView()
}
