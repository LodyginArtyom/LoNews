//
//  OneNewsViewController.swift
//  LoNews
//
//  Created by Артем Лодыгин on 20.06.2022.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {
    
    var index: Int = 0
    
    var article: ArticlesCore!
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var openUrl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = article.title
        labelDescription.text = article.content
        
        if URL(string: article.url!) == nil{
            openUrl.isEnabled = false
        }
        
        DispatchQueue.main.async {
            if let urlImage = URL(string: self.article.urlImage!) {
                if let data = try? Data(contentsOf: urlImage){
                    self.imageView.image = UIImage(data: data)
                }
            }else{
                self.imageView.image = UIImage(named: "no photo")
            }
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let urlNews = URL(string: article.url!) {
            let svc = SFSafariViewController(url: urlNews)
            present(svc, animated: true)
        }
        
    }
    
    
}
