//
//  DiaryView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/13/24.
//

import SwiftUI

struct DiaryView: View {
    var matchResult: MatchResult
    @State var text: String = ""
    @State var titleText: String = ""
    @State private var isAdd: Bool = true
    @Binding var isShowSheet: Bool
    @Binding var selectedIndex: Int
    @StateObject var viewModel = DiaryViewModel()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 150, height: 5)
                .clipShape(.capsule)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            
            HStack {
                Text("Red Devils' Journey")
                    .font(Font.system(size: 30, weight: .bold))
                    .padding()
                
                Spacer()
            }
                    
            VStack {
                
                Text(matchResult.date[selectedIndex])
                HStack {
                    Spacer()
                    Text("ManChester Utd vs")
                    Text(matchResult.enemy[selectedIndex])
                    Spacer()
                }
                Text(matchResult.goal[selectedIndex])
            }
            
            TextField("Add New Diary Title here...", text: $titleText, axis: .vertical)
                .font(.headline)
                .padding()
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .textFieldStyle(.plain)
                .onAppear(perform: UIApplication.shared.hideKeyboard)
            
            
            TextField("Add New Diary here...", text: $text, axis: .vertical)
                .font(.headline)
                .padding()
                .frame(height: UIScreen.main.bounds.height / 1.9)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .textFieldStyle(.plain)
                .onAppear(perform: UIApplication.shared.hideKeyboard)
            
            Button(action: {
                viewModel.addDiary(context: text, listTitle: titleText)
                isShowSheet = false
            }, label: {
                Text("Add")
            })
            .padding()
            .frame(width: 350)
            .background(Color.red)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .padding(.top, 10)
            
            Spacer()
        }
        .background(
            Image("manutd")
                .resizable()
                .frame(width: 300, height: 300)
                .opacity(0.1))
    }
}

#Preview {
    DiaryView(matchResult: MatchResult(leage: ["Premier League"], YM: ["2024"], date: ["April 15, 2024"], goal: ["2 - 0"], enemy: ["Liverpool"]), isShowSheet: .constant(false), selectedIndex: .constant(0))
}
