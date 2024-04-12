//
//  MatchesResultBtn.swift
//  TheManU
//
//  Created by LeeWanJae on 4/12/24.
//
// TODO: - 디자인 바꾸기
// 1. 명암으로 높낮이를 주고
// 2. 색상
// 3. 비율 위에 정보가 많고 밑에는 정보가 적게 비대칭
// 여백이 뭔가.... 너꺼다 내꺼다 잘 나누기 Your Feed -----------------------

import SwiftUI

struct MatchesResultBtn: View {
    var date: String
    var goal1: String
    var goal2: String
    var league: String
    var matchTeam1: String
    var matchTeam2: String
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
                            
                            Text(matchTeam1)
                                .font(Font.system(size: 14))
                                .frame(width: 100, height: 50)
                        }
                      
                        VStack {
                            Text(league)
                                .padding(7)
                                .foregroundStyle(.gray)
                                .bold()
                            
                            Text(date)
                                .font(Font.system(size: 12))
                                .padding(.bottom, 5)
                            
                            HStack {
                                Text(goal1)
                                Text(":")
                                Text(goal2)
                                    
                            }
                            .font(Font.system(size: 32))
                            .bold()
                            .padding(.bottom, 10)
                        }
                        .padding(.bottom, 30)
                        
                        VStack {
                            Image("manutd")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(matchTeam2)
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
    MatchesResultBtn(date: "Saturday 13th April", goal1: "3", goal2: "3", league: "Premier League", matchTeam1: "Manchester United", matchTeam2: "Bournemouth") {
        print("버튼 클릭")
    }
}
