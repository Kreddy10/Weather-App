//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import Foundation

protocol WeatherDetailVMDelegate {
    func weatherLoaded()
}

class WeatherDetailViewModel {
    
    var delegate: WeatherDetailVMDelegate?
    
    
    var weatherData: WeatherModel?
    
    var location: SearchModel? {
        didSet {
            self.fetchWeather()
        }
    }
    func fetchWeather() {
        //self.delegate?.startLoading()
        // API call to fetch weather
        WeatherAPI.provider.request(
            .weatherFor(
                lat: location?.lat ?? 0.0,
                long: location?.lon ?? 0.0
            )
        ) { [weak self] result in
            switch result{
            case .success(let response):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.weatherData = try? decoder.decode(
                    WeatherModel.self,
                    from: response.data
                )
                DispatchQueue.main.async {
                    self?.delegate?.weatherLoaded()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

    
    
