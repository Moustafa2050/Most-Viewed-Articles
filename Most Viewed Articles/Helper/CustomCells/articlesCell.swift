//
//  articlesCell.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import UIKit
import SDWebImage


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
        sourceArticleLb.text = article.byline?.replacingOccurrences(of: "By", with: "").trimmingCharacters(in: .whitespaces)
        puplishedDateLb.text = article.updated?.toDate()
        if(article.media?.count ?? 0 > 0){
            if(article.media?[0].mediaMetadata?.count ?? 0 > 0){
                if let imageURL = article.media?[0].mediaMetadata?[0].url {
                    articaleImg.makeCircular()
                    articaleImg.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
                }
                
               
            }
            
        }
        
    }
    
    override func prepareForReuse() {
        articaleTitleLb.text = nil
        articaleHintLb.text = nil
        sourceArticleLb.text = nil
        puplishedDateLb.text = nil
        articaleImg.image = nil
    }
    
}
