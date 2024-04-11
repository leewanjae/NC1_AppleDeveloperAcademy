//
//  MatchUP.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import Foundation


struct MatchUP: Identifiable, Codable {
    var id: String = UUID().uuidString
    let leage: [String]
    let YM: [String]
    let date: [String]
    let time: [String]
    let enemy: [String]
}
