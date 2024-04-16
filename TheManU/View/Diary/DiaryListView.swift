//
//  DiaryListView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/16/24.
//

import SwiftUI

struct DiaryListView: View {
    @StateObject var viewModel = DiaryViewModel()
    
    var body: some View {
        List {
            Text("Cell1")
        }
        
    }
}

#Preview {
    DiaryListView()
}
