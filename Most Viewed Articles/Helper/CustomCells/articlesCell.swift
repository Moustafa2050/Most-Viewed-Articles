//
//  articlesCell.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import UIKit

class articlesCell: UITableViewCell {
    
    
    @IBOutlet weak var articaleImg: UIImageView!
    
    @IBOutlet weak var articaleTitleLb: UILabel!
    
    @IBOutlet weak var articaleHintLb: UILabel!
    
    @IBOutlet weak var sourceArticleLb: UILabel!
    
    @IBOutlet weak var puplishedDateLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with article: ArticleModel) {
        articaleTitleLb.text = article.title
        articaleHintLb.text = article.abstract
        sourceArticleLb.text = article.byline
        puplishedDateLb.text = article.updated?.toDate()
        
    }
    
}
