//
//  SearchViewTableViewCell.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var citySubtitle: UILabel!
    var location: SearchModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setupDesign
    }
    
    func configure(for location: SearchModel) {
        self.location = location
        setupLabels()
    }
    
    func configureAsLoadingCell() {
        self.cityTitle?.text = "Loading City.."
        self.citySubtitle?.text = "Loading Country.."
        self.location = nil
    }
    
    private func setupLabels() {
        cityTitle?.text = location?.name
        let state = location?.state ?? ""
        let country = location?.country ?? ""
       citySubtitle?.text = state
        if state.isEmpty {
            citySubtitle?.text = country
        } else {
            citySubtitle?.text = state + ", " + country
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
