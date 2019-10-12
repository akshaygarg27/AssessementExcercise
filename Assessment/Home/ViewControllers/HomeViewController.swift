//
//  HomeViewController.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import UIKit

/// Home view controller contains the UI Action & responses
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    /// Configure Home View
    private func configureView() {
        (view as? HomeView)?.delegate = self
        (view as? HomeView)?.activityIndicator.startAnimating()
        fetchExerciseData()
    }
    
    /// Set data help to fetch data from file.
    private func fetchExerciseData() {
        Presenter.fetchExerciseData { (exercise, success) in
            (self.view as? HomeView)?.activityIndicator.stopAnimating()
            if !success { return }
            self.title = exercise?.displayHeaderTitle
            (self.view as? HomeView)?.setData(exercise)
        }
    }
}

// MARK: - HomeViewOutputProtocol
extension HomeViewController: HomeViewOutputProtocol {
    func selectedCell(at: Int, article: ArticleViewModel) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }

        (detailViewController.view as? DetailView)?.setData(article)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func refreshView() {
        
        fetchExerciseData()
    }
}
