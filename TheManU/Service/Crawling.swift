//
//  Crawling.swift
//  TheManU
//
//  Created by LeeWanJae on 4/10/24.
//

import Foundation
import SwiftSoup

//TODO: - 크롤링 이후 VM에서 Match Model과 결합해서 사용
// .fixres__header2 경기 일자 -
// .fixres__header1 경기 달 -
// .matches__date 경기 시간 -
// .swap-text__target 경기 팀 -
// .fixres__header3 리그 -

class Crawling: ObservableObject {
    let url = "https://www.skysports.com/manchester-united-fixtures"
    
    func crawl() {
        guard let url = URL(string: url) else { return print("url error") }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
            print(headerTitle)
            
            let date: Elements = try doc.select(".fixres__header2")
            for date in date {
                print("경기 일자:", try date.text())
            }
            
            let matchup: Elements = try doc.select(".swap-text__target")
            for team in matchup {
                print("팀:", try team.text())
            }
            
            let leages: Elements = try doc.select(".fixres__header3")
            for leage in leages {
                print("리그:", try leage.text())
            }
            
            let times: Elements = try doc.select(".matches__date")
            for time in times {
                print("경기 시간:", try time.text())
            }
            
            let months: Elements = try doc.select(".fixres__header1")
            for month in months {
                print("경기 달:", try month.text())
            }
        } catch {
            print("error")
        }
    }
}
