//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import Foundation

// MARK: - Welcome
//struct WeatherModel: Codable {
    struct WeatherModel: Codable {
        //let coord: Coord
        let weather: [Weather]?
        ///let base: String
        let main: Main?
        //let visibility: Int
        let wind: Wind?
        //let clouds: Clouds
       // let dt: Int
       // let sys: Sys
        //let timezone, id: Int
        let name: String?
       // let cod: Int
    }

    // MARK: - Clouds
    struct Clouds: Codable {
        let all: Int
    }

    // MARK: - Coord
    struct Coord: Codable {
        let lon, lat: Double
    }

    // MARK: - Main
    struct Main: Codable {
        let feelsLike : Float?
        let humidity : Int?
        let pressure : Int?
        let temp : Float?
        let tempMax : Float?
        let tempMin : Float?

    }

    // MARK: - Sys
    struct Sys: Codable {
        let type, id: Int
        let country: String
        let sunrise, sunset: Int
    }

    // MARK: - Weather
    struct Weather: Codable {
        let id: Int?
        let main, description, icon: String?
    }

    // MARK: - Wind
    struct Wind: Codable {
        let speed:  Float?
        let deg: Int?
        //let gust: Double
    }
