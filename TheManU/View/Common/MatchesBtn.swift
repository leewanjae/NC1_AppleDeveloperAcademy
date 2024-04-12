//
//  MatchesBtn.swift
//  TheManU
//
//  Created by LeeWanJae on 4/11/24.
//

import SwiftUI

struct MatchesBtn: View {
    var date: String
    var matchTime: String
    var league: String
    var enemies: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 180)
                        .padding(.horizontal, 5)
                        .shadow(color: .gray.opacity(0.5), radius: 15, x: 10, y: 10)
                        .foregroundStyle(.white)
                    
                    HStack {
                        VStack {
                            Image("manutd")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("Machester United")
                                .font(Font.system(size: 14))
                                .frame(width: 100, height: 50)
                        }
                        
                        VStack {
                            Text(league)
                                .padding(7)
                                .foregroundStyle(.gray)
                                .bold()
                            
                            Text(date)
                                .font(Font.system(size: 17))
                                .bold()
                            
                            Text(matchTime)
                                .font(Font.system(size: 15))
                                .padding(.bottom, 5)
                            Text("VS")
                        }
                        .padding(.bottom, 30)
                        
                        VStack {
                            Image("manutd")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text(enemies)
                                .font(Font.system(size: 14))
                                .frame(width: 100, height: 50)
                        }
                    }
                }
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    MatchesBtn(date:"Saturday 13th April", matchTime: "15:30", league: "Premier League", enemies: "Bournemouth") {
        print("버튼 클릭")
    }
}
