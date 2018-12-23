//
//  SampleRxTableView.swift
//  SampleRxTableView
//
//  Created by Mariusz Sut on 23/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SampleRxTableView: UITableViewController {

    fileprivate let searchBarController = UISearchController(searchResultsController: nil)
    fileprivate let bag = DisposeBag()
    fileprivate let viewModel = SampleRxViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBar()
        self.searchBarController.searchBar.rx.text.bind(to: viewModel.searchText).disposed(by: bag)
        self.tableView.register(SampleRxTableViewCell.self, forCellReuseIdentifier: "Cell")
        viewModel.repositories.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "Cell", cellType: SampleRxTableViewCell.self)) { row, item, cell in
                cell.repositoryNameLabel?.text = item.fullName
                cell.repositoryUserNameLabel?.text = item.owner.login
                cell.repositoryUrlLabel?.text = item.htmlURL
                cell.repositoryStarsLabel?.text = String(item.watchers)
        }
        .disposed(by: bag)
    }
    
    fileprivate func setupSearchBar() {
        self.searchBarController.obscuresBackgroundDuringPresentation = false
        self.searchBarController.searchBar.showsCancelButton = true
        self.searchBarController.searchBar.placeholder = "Enter repository name"
        self.tableView.tableHeaderView = self.searchBarController.searchBar
    }
    
}

