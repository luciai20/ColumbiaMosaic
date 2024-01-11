//
//  Event.swift
//  ColumbiaMosaic
//
//  Created by Lucia Perez-Saignac on 12/17/23.
//

import Foundation

struct Event: Codable {
    let id: Int
    let title: String
    let date: String
    let time: String
    let location: String
    let type: String
    let category: String
    let description: String
}
