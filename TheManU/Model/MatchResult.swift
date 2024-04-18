//
//  MatchResult.swift
//  TheManU
//
//  Created by LeeWanJae on 4/11/24.
//

import SwiftUI

struct MatchResult: Identifiable {
    var id: String = UUID().uuidString
    let leage: [String]
    let YM: [String]
    let date: [String]
    let goal: [String]
    let enemy: [String]
}
