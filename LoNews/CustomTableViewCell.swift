//
//  CustomTableViewCell.swift
//  LoNews
//
//  Created by Артем Лодыгин on 24.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBAction func makeFavorites(_ sender: Any) {
        let likePost = articles[favoritesOutlet.tag]
        favoritesOutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        
    }
    @IBOutlet weak var favoritesOutlet: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
