//
//  HomeModel.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import Foundation

/// Exercise Model.
struct Exercise: Codable {
    var title: String?
    var articles: [Article]?
    
    init(_ dict: Dictionary<String, AnyObject>) {
        self.title = dict["title"] as? String
        
        guard let articles = dict["articles"] as? [Dictionary<String, AnyObject>] else {
            return
        }

        self.articles = articles.compactMap({ (dict) -> Article? in
            if let title = dict["title"] as? String, !title.isEmpty {
                return Article(dict)
            }
            return nil
        })
    }
}

/// Article Model.
struct Article: Codable {
    var title: String?
    var website: String?
    var authors: String?
    var date: String?
    var content: String?
    var tag: Tag?
    var imageURL: String?
    
    init(_ dict: Dictionary<String, AnyObject>) {
        self.title = dict["title"] as? String
        self.website = dict["website"] as? String
        self.authors = dict["authors"] as? String
        self.date = dict["date"] as? String
        self.content = dict["content"] as? String
        self.imageURL = dict["image_url"] as? String
        
        if let dict = dict["tag"] as? Dictionary<String, AnyObject> {
            self.tag = Tag(dict)
        }
    }
}

/// Article tag Model.
struct Tag: Codable {
    var tagID: Int?
    var label: String?
    
    
    init(_ dict: Dictionary<String, AnyObject>) {
        self.tagID = dict["id"] as? Int
        self.label = dict["label"] as? String
    }
}
