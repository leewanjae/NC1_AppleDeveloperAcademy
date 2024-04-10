//
//  Match.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import Foundation


struct Match: Identifiable, Codable {
    var id: String = UUID().uuidString
    let homeTeam: String
    let awayTeam: String
    let homeGoal: String
    let awayGoal: String
    let win: String
    let date: String
}
