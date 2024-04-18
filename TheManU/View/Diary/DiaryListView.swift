//
//  DiaryListView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/16/24.
//

import SwiftUI

struct DiaryListView: View {
    @State var isSelection: Bool = false
    @ObservedObject var viewModel = DiaryViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.diariesEntity, id: \.self) { diary in
                    NavigationLink {
                        DiaryDetailView(diaryEntity: diary)
                    } label: {
                        Text("\(diary.listTitle ?? "")")
                    }
                }
                .onDelete(perform: { indexSet in
                    viewModel.deleteDiary(indexSet: indexSet )
                })
            }
        }
        .navigationTitle("List")
        .onAppear {
            viewModel.fetchDiary()
        }
    }
}

#Preview {
    DiaryListView()
}
