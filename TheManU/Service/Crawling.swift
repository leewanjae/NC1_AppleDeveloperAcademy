//
//  Crawling.swift
//  TheManU
//
//  Created by LeeWanJae on 4/10/24.
//

import Foundation
import SwiftSoup

//TODO: - 크롤링 이후 VM에서 Match Model과 결합해서 사용
// .fixres__header2 경기 일자
// .fixres__header1 경기 달
// .matches__date 경기 시간
// .swap-text__target 경기 팀
// .fixres__header3 리그

class Crawling: ObservableObject {
    let url = "https://www.skysports.com/manchester-united-fixtures"
    
    func crawl() {
        guard let url = URL(string: url) else { return print("url error") }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
            print(headerTitle)
            
            // TODO: - headerTitle, ✅경기 일자, 홈, 어웨이
            
            let matchup: Elements = try doc.select(".fixres__header2")
            for match in matchup {
                print(try match.text())
            }
    
        } catch {
            print("error")
        }
    }
}
