//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperatureText: UILabel!
    @IBOutlet weak var feelsLikeText: UILabel!
    @IBOutlet weak var weatherTitle: UILabel!
    @IBOutlet weak var weatherSubtitle: UILabel!
    
    var viewModel = WeatherDetailViewModel()
    var coordinator: RootCordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setLocation(with location: SearchModel) {
        //self.viewModel.delegate = self
        self.viewModel.location = location
        // weatherLoaded()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension WeatherDetailViewController: WeatherDetailVMDelegate {
//    
//    func weatherLoaded() {
//        guard let weather = viewModel.weatherData else { return }
//        self.cityLabel.text = weather.name
//        
////        self.weatherIcon.sd_setImage(
////            with: getImageFor(name: weather.weather?.first?.icon ?? "01d"),
////            completed: nil)
////        self.weatherIcon.image = viewModel.weatherIcon
//        self.weatherTitle.text = weather.weather.first?.main
//        self.weatherSubtitle.text = weather.weather.first?.description
////        guard let temperature = weather.main.temp,
////              let feelsLike = weather.main.feelsLike else { return }
////        self.temperatureText.text = String(describing: temperature) + " °C"
////        self.feelsLikeText.text = "Feels like " + String(describing: feelsLike) + " °C"
//    }
//
//    
//}
