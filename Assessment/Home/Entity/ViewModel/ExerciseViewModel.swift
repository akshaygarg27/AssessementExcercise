//
//  HomeViewModel.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import Foundation

/// Exercise View Model.
protocol ExerciseViewModel {
    var displayHeaderTitle: String? { get }
    var articleList: [ArticleViewModel]? { get }
}

// MARK: - Exercise View Model.
extension Exercise: ExerciseViewModel {
    var displayHeaderTitle: String? {
        return title
    }
    
    var articleList: [ArticleViewModel]? {
        return articles
    }
}

/// Article View Model.
protocol ArticleViewModel {
    var displayTitle: String? { get }
    var displayContent: String? { get }
    var articleImageURL: String? { get }
}

// MARK: - Article View Model.
extension Article: ArticleViewModel {
    var displayTitle: String? {
        return title
    }
    
    var displayContent: String? {
        return content
    }
    
    var articleImageURL: String? {
        return imageURL
    }
}
