//
//  SearchModel.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import Foundation

struct SearchModel: Codable {
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
}
