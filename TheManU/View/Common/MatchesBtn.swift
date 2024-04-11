//
//  MatchesBtn.swift
//  TheManU
//
//  Created by LeeWanJae on 4/11/24.
//

import SwiftUI

struct MatchesBtn: View {
    var ym: String
    var date: String
    var matchTime: String
    var league: String
    var enemies: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(ym)
                    .padding(.leading)
                Spacer()
            }
           
            Button(action: action) {
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .frame(width: 370, height: 200)
                        .padding(.horizontal, 10)
                        .shadow(color: .gray, radius: 15, x: 10, y: 10)
                        .foregroundStyle(.white)
                    
                    HStack {
                        VStack {
                            Image("manutd")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("Machester United")
                                .font(Font.system(size: 15))
                                .frame(width: 100, height: 50)
                        }
                        
                        VStack {
                            Text(league)
                                .bold()
                                .padding(.bottom, 20)
                            
                            Text(date)
                                .font(Font.system(size: 12))
                            
                            Text(matchTime)
                                .font(Font.system(size: 12))
                                .padding(.bottom, 10)
                            Text("VS")
                        }
                        .padding(.bottom, 30)
                        
                        VStack {
                            Image("manutd")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(enemies)
                                .font(Font.system(size: 15))
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
    MatchesBtn(ym: "April 2024", date:"Saturday 13th April", matchTime: "15:30", league: "Premier League", enemies: "Bournemouth") {
        print("버튼 클릭")
    }
}
