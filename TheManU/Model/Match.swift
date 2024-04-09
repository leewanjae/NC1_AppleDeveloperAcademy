//
//  Match.swift
//  TheManU
//
//  Created by LeeWanJae on 4/8/24.
//

import Foundation

struct Match: Decodable {
    let away: String
    let date: String
    let goal: Goal
    let home: String
    let win: String
}

struct Goal: Decodable {
    let away: Int
    let home: Int
}
