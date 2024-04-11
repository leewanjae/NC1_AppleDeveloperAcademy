//
//  Crawling.swift
//  TheManU
//
//  Created by LeeWanJae on 4/10/24.
//

import Foundation
import SwiftSoup

//TODO: - 크롤링한 데이터 모델에 맞게 저장

class Crawling: ObservableObject {
    var matchups: MatchUP = MatchUP(leage: [], YM: [], date: [], time: [], enemy: [])
    var matchResult: MatchResult = MatchResult(leage: [], YM: [], date: [], goal: [], enemy: [])
    
    // MARK: - 맨유 경기 일정
    func crawlingMatchup(completion: @escaping ((MatchUP) -> Void)) {
        let url = "https://www.skysports.com/manchester-united-fixtures"
        var dateArr: [String] = []
        var enemieArr: [String] = []
        var leagueArr: [String] = []
        var ymArr: [String] = []
        var timeArr: [String] = []
        
        guard let url = URL(string: url) else { return print("url error") }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
            print(headerTitle)
            
            let date: Elements = try doc.select(".fixres__header2") // .fixres__header2 경기 일자
            for date in date {
                let dateText = try date.text()
                dateArr.append(dateText)
            }
            
            let matchup: Elements = try doc.select(".swap-text__target") // .swap-text__target 경기 팀
            for team in matchup {
                let teamText = try team.text()
                if teamText != "Manchester United" {
                    enemieArr.append(teamText)
                }
            }
            
            let leages: Elements = try doc.select(".fixres__header3") // .fixres__header3 리그
            for leage in leages {
                let leageText = try leage.text()
                leagueArr.append(leageText)
            }
            
            let times: Elements = try doc.select(".matches__date") // .matches__date 경기 시간
            for time in times {
                let timeText = try time.text()
                timeArr.append(timeText)
                
            }
            
            let months: Elements = try doc.select(".fixres__header1") // .fixres__header1 경기 달
            for ym in months {
                let ymText = try ym.text()
                ymArr.append(ymText)
            }
            matchups = MatchUP(leage: leagueArr, YM: ymArr, date: dateArr, time: timeArr, enemy: enemieArr)
            completion(matchups)
            print("매치 일정입니다: \(matchups)")
            
        } catch {
            print("error")
        }
    }
    
    // MARK: - 맨유 경기 결과
    func crwalingResult(completion: @escaping ((MatchResult) -> Void)) {
        let url = "https://www.skysports.com/manchester-united-results"
        var dateArr: [String] = []
        var enemieArr: [String] = []
        var leagueArr: [String] = []
        var goalArr: [String] = []
        var ymArr: [String] = []
        
        guard let url = URL(string: url) else { return print("url error") }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
            print(headerTitle)
            
            let date: Elements = try doc.select(".fixres__header2")
            for date in date {
                let dateText = try date.text()
                dateArr.append(dateText)
            }
            
            let matchup: Elements = try doc.select(".swap-text__target")
            for team in matchup {
                let teamText = try team.text()
                if teamText != "Manchester United" {
                    enemieArr.append(teamText)
                }
            }
            
            let leages: Elements = try doc.select(".fixres__header3")
            for leage in leages {
                let leageText = try leage.text()
                leagueArr.append(leageText)
            }
            
            let goals: Elements = try doc.select(".matches__teamscores-side")
            for goal in goals {
                let goalText = try goal.text()
                goalArr.append(goalText)
            }
            
            let months: Elements = try doc.select(".fixres__header1")
            for month in months {
                let ymText = try month.text()
                ymArr.append(ymText)
            }
            
            matchResult = MatchResult(leage: leagueArr, YM: ymArr, date: dateArr, goal: goalArr, enemy: enemieArr)
            completion(matchResult)
            print("매치 결과입니다: \(matchResult)")
        } catch {
            print("error")
        }
    }
}