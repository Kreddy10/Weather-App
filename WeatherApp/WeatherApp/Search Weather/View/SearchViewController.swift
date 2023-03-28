//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by V kishore kumar reddy  on 3/27/23.
//

import UIKit

class SearchViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.register(UINib(nibName: "SearchViewTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchViewTableViewCell")
        searchBar.delegate = self
        self.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }

        private func setupTableView() {
            
            let backgroundView = EmptyStateView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: searchTableView.frame.width,
                    height: searchTableView.frame.height
                )
            )
            
            backgroundView.delegate = self
            searchTableView.backgroundView = backgroundView
            searchTableView.backgroundView?.isUserInteractionEnabled = true
            searchTableView.backgroundView?.isHidden = false
            backgroundView.configure(
                titleText: "No Data Available",
                subtitleText: "Please enter text in search term to fetch list of places",
                buttonText: "Go Random")
            viewModel.reloadUI = { [weak self] in
                self?.searchTableView.reloadData()
                let emptyResultsViewIsHidden = !((self?.viewModel.searchResultList?.count ?? 0) == 0)
                self?.searchTableView.backgroundView?.isHidden = emptyResultsViewIsHidden
                if !emptyResultsViewIsHidden {
                    switch self?.searchBar.text?.isEmpty {
                    case true:
                        backgroundView.configure(
                            titleText: "No Data Available",
                            subtitleText: "Please enter text in search term to fetch list of places",
                            buttonText: "Go Random")
                    default:
                        backgroundView.configure(
                            titleText: "No results found",
                            subtitleText: "Please enter a different search term",
                            buttonText: "Go Random")
                    }
                }
            }
        }
    }
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.performSearch(text: searchText)
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTableView.deselectRow(at: indexPath, animated: true)
        if viewModel.isLoading {
            return
        }
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherDetailVC") as! WeatherDetailVC
        let location = viewModel.searchResultList?[indexPath.row]
         vc.setLocation(with: location! )
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.isLoading {
            return 3
        }
        else {
            return viewModel.searchResultList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewTableViewCell", for: indexPath) as! SearchViewTableViewCell
        
        if viewModel.isLoading {
            cell.configureAsLoadingCell()
        } else {
            if let location = viewModel.searchResultList?[indexPath.row] {
                cell.configure(for: location)
            }
        }
        return cell
    }
}

extension SearchViewController: EmptyStateDelegate {
    func buttonDidTap(_ sender: UIButton) {
        print("Show all Tapped")
        self.searchBar.text = randomString()
        viewModel.performSearch(text: searchBar.text ?? "")
    }
    
    func randomString(length: Int = 1) -> String {
      let letters = "ABCDEFGHIJKLuNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
