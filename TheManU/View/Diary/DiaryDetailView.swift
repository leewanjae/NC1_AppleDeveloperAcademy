//
//  DiaryDetailView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/16/24.
//

import SwiftUI

struct DiaryDetailView: View {
    var diaryEntity: DiariesEntity
    
    var body: some View {
        VStack {
            Text(diaryEntity.matchDate ?? "")
            HStack {
                Spacer()
                
                Text("ManChester Utd vs")
                Text(diaryEntity.enemies ?? "")
                Spacer()
            }
            Text(diaryEntity.goal ?? "")
            
            HStack {
                Text(diaryEntity.context ?? "")
                    .font(Font.system(size: 16))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding()
            Spacer()
        }
        .background(
            Image("manutd")
                .resizable()
                .frame(width: 300, height: 300)
                .opacity(0.1))
        
        .navigationTitle(diaryEntity.listTitle ?? "")
    }
}
