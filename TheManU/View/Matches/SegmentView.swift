//
//  SegmentView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/12/24.
//

import SwiftUI

struct SegmentView: View {
    @State private var selectedMenuIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Menu", selection: $selectedMenuIndex) {
                    Text("Fixtures").tag(0)
                    Text("Restuls").tag(1)
                }
                .pickerStyle(.segmented)
                
                
                if selectedMenuIndex == 0 {
                    MatchesView()
                } else if selectedMenuIndex == 1 {
                    MatchResultView()
                }
            }
        }
    }
}

#Preview {
    SegmentView()
}
