//
//  CustomTableViewCell.swift
//  LoNews
//
//  Created by Артем Лодыгин on 24.06.2022.
//

import UIKit
import CoreData

class CustomTableViewCell: UITableViewCell {
    
    @IBAction func makeFavorites(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<ArticlesCore> = ArticlesCore.fetchRequest()
        
        do {
             newsInCoreData = try! context.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        if newsInCoreData[favoritesOutlet.tag].favorite == false{
            newsInCoreData[favoritesOutlet.tag].favorite = true
            favoritesOutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            newsInCoreData[favoritesOutlet.tag].favorite = false
            favoritesOutlet.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        do {
              try context.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
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
