//
//  HomeView.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import UIKit

/// Home view output protocols.
protocol HomeViewOutputProtocol: class {
    /// Selected cell details.
    ///
    /// - Parameters:
    ///   - at: Selected cell index, Type will be **Int**
    ///   - article:
    func selectedCell(at: Int, article: ArticleViewModel)
    
    func refreshView()
}

/// Home view contains the TableView.
class HomeView: UIView {
    
    @IBOutlet private weak var tableViewHome: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var exerciseViewModel: ExerciseViewModel?
   
    weak var delegate: HomeViewOutputProtocol?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(HomeView.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    /// Set Data To TableView Cell
    ///
    /// - Parameter exercise: ExerciseViewModel.
    func setData(_ exercise: ExerciseViewModel?) {
        exerciseViewModel = exercise
        self.tableViewHome.addSubview(self.refreshControl)
        self.refreshControl.endRefreshing()
        tableViewHome.isHidden = false
        tableViewHome.tableFooterView = UIView()
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.reloadData()
    }
    
    /// Pull down to refresh handle
    ///
    /// - Parameter refreshControl: Object should be type of **UIRefreshControl**.
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        delegate?.refreshView()
    }
}

// MARK: - UITableView Delegates and DataSource Methods
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = exerciseViewModel?.articleList?.count else {
            return 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        if let article = exerciseViewModel?.articleList?[indexPath.row] {
            cell.setArticleData(article)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = exerciseViewModel?.articleList?[indexPath.row] else {
            return
        }
        delegate?.selectedCell(at: indexPath.row, article: article)
    }
}
