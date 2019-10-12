//
//  DetailView.swift
//  Assessment
//
//  Created by Omika Garg on 11/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import UIKit
import SDWebImage

/// Detail view contains the detail view elements.
class DetailView: UIView {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var imageBanner: UIImageView!

    
    /// Set data In detail view elements.
    ///
    /// - Parameter article: Object should be **ArticleViewModel**.
    func setData(_ article: ArticleViewModel) {
        labelTitle.text = article.displayTitle
        labelSubTitle.text = article.displayContent
        
        if let imageURLString = article.articleImageURL {
            let imageURL = URL(string: imageURLString)
            imageBanner.sd_setImage(with: imageURL, placeholderImage: UIImage(named: ""))
        } else {
            imageBanner.image = nil
        }
    }
}
