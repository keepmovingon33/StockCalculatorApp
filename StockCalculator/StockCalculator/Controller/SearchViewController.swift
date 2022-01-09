//
//  ViewController.swift
//  StockCalculator
//
//  Created by sky on 1/7/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        // need to conform UISearchResultsUpdating
        sc.searchResultsUpdater = self
        // need to conform UISearchCOntrollerDelegate
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Enter a company name or symbol"
        sc.searchBar.autocapitalizationType = .allCharacters
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
}

// MARK: - UISearchController Methods

extension SearchViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    // this func needs implementation because we conform UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
