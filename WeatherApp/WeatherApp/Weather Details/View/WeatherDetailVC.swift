//
//  WeatherDetailVC.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/28/23.
//

import UIKit

class WeatherDetailVC: UIViewController {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperatureTextLbl: UILabel!
    @IBOutlet weak var weatherTitleLbl: UILabel!
    @IBOutlet weak var weatherHumidityLbl: UILabel!
    @IBOutlet weak var weatherPressureLbl: UILabel!
    
    var viewModel = WeatherDetailViewModel()
    //var coordinator: RootCordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setLocation(with location: SearchModel) {
        self.viewModel.delegate = self
        self.viewModel.location = location
    }

}

extension WeatherDetailVC: WeatherDetailVMDelegate {

    func weatherLoaded() {
        guard let weather = viewModel.weatherData else { return }
        self.cityNameLbl.text = weather.name
        self.weatherIcon.setImage(with: weather.weather?.first?.icon ?? "02d")
        self.weatherTitleLbl.text = weather.weather?.first?.description
        guard let temperature = weather.main?.temp,
              let humidity = weather.main?.humidity,
              let pressure = weather.main?.pressure else { return }
        self.temperatureTextLbl.text = String(describing: temperature) + " °C"
        self.weatherHumidityLbl.text = "Humidity: " + String(describing: humidity)
        self.weatherPressureLbl.text = "Pressure: " + String(describing: pressure)

    }


}
    

   


