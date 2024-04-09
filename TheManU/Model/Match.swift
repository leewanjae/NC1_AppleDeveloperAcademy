//
//  Match.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import Foundation


struct Match: Identifiable, Codable {
    var id: String = UUID().uuidString
    let away: String
    let date: String
    let home: String
    let win: String
    let goal: Goal
}

struct Goal: Codable {
    let home: Int
    let away: Int
}

