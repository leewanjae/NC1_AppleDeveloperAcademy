//
//  DiaryView.swift
//  TheManU
//
//  Created by LeeWanJae on 4/13/24.
//

import SwiftUI

struct DiaryView: View {
    @State var text: String = ""
    @State private var isAdd: Bool = true
    @StateObject var viewModel = DiaryViewModel()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 150, height: 5)
                .clipShape(.capsule)
                .foregroundStyle(.gray)
                .padding()
            
            HStack {
                Text("Red Devils' Journey")
                    .font(Font.system(size: 30, weight: .bold))
                    .padding()
                Spacer()
            }
                        
            TextField("Add New Diary here...", text: $text, axis: .vertical)
                .font(.headline)
                .padding()
                .frame(height: UIScreen.main.bounds.height / 1.5)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
                .textFieldStyle(.plain)
                .onAppear(perform: UIApplication.shared.hideKeyboard)
            
            Button(action: {
                viewModel.addDiary(context: text)
                viewModel.fetchDiary()
            }, label: {
                Text("Add")
            })
            .frame(width: 335)
            .padding()
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
    DiaryView()
}
