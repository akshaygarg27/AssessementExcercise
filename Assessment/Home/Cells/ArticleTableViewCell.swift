//
//  ArticleTableViewCell.swift
//  Assessment
//
//  Created by Omika Garg on 10/10/19.
//  Copyright © 2019 Akshay Garg. All rights reserved.
//

import UIKit
import SDWebImage

/// ArticleTableViewCell Contain visual elements and controls on the screen
class ArticleTableViewCell: UITableViewCell {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelContent: UILabel!
    @IBOutlet private weak var imageBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    /// Set Article Data.
    ///
    /// - Parameter article: Object should be **ArticleViewModel**.
    func setArticleData(_ article: ArticleViewModel) {
        labelTitle.text = article.displayTitle
        labelContent.text = article.displayContent
        
        if let imageURLString = article.articleImageURL {
            let imageURL = URL(string: imageURLString)
            imageBanner.sd_setImage(with: imageURL, placeholderImage: UIImage(named: ""))
        } else {
            imageBanner.image = nil
        }
    }
}
