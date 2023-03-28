//
//  UIImageView + Extension.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/28/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with name: String) {
        
        let urlString = "https://openweathermap.org/img/wn/*@2x.png"
            .replacingOccurrences(of: "*", with: name)
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
    
//    private func getImageFor(name: String) -> URL {
//        let urlString = "https://openweathermap.org/img/wn/*@2x.png"
//            .replacingOccurrences(of: "*", with: name)
//        return URL(string: urlString)!
//    }
}
