//
//  MatchesVM.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import Foundation
import SwiftUI

class MatchesVM: ObservableObject {
    @Published var matchup: MatchUP?
    @Published var matchResult: MatchResult?
    
    func fetchMatchup() {
        Crawling().crawlingMatchup { [weak self] matches in
            DispatchQueue.main.async {
                self?.matchup = matches
            }
        }
    }
    
    func fetchMatchResult() {
        Crawling().crwalingResult { [weak self] matches in
            DispatchQueue.main.async {
                self?.matchResult = matches
            }
        }
    }
}
