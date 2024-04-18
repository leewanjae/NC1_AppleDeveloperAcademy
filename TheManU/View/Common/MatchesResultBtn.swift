//
//  MatchesResultBtn.swift
//  TheManU
//
//  Created by LeeWanJae on 4/12/24.
//

import SwiftUI

struct MatchesResultBtn: View {
    var date: String
    var goal: String
    var league: String
    var imageName: String
    var matchTeam: String
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
                            
                            Text("Manchester United")
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
                                Text(goal)
                                
                            }
                            .font(Font.system(size: 32))
                            .bold()
                            .padding(.bottom, 10)
                        }
                        .padding(.bottom, 30)
                        
                        VStack {
                            if teamLogoList.contains(where: { imageName.contains($0) }) {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            } else {
                                Image("Soccer")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            Text(matchTeam)
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
    MatchesResultBtn(date: "Saturday 13th April", goal: "3 : 3", league: "Premier League", imageName: "Chelsea", matchTeam: "Bournemouth") {
        print("버튼 클릭")
    }
}
