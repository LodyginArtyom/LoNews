//
//  FavoriteTableViewController.swift
//  LoNews
//
//  Created by Артем Лодыгин on 25.06.2022.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    var articlesCoreFavorite: [ArticlesCore] = takeFavoriteNews()
    
    @IBAction func refreashControllAction(_ sender: UIRefreshControl) {
        articlesCoreFavorite = takeFavoriteNews()
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(articlesCoreFavorite.count)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articlesCoreFavorite.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let article = articlesCoreFavorite[indexPath.row]
        
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.content
        
        if let urlImage = URL(string: article.urlImage!) {
            if let data = try? Data(contentsOf: urlImage){
                cell.iconImageView.image = UIImage(data: data)
            }
        }else{
            cell.iconImageView.image = UIImage(named: "no photo")
        }
        
        if article.favorite {
            cell.favoritesOutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            cell.favoritesOutlet.setImage(UIImage(systemName: "star"), for: .normal)
        }
        cell.favoritesOutlet.tag = indexPath.row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToFavoriteNews", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFavoriteNews" {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as? OneNewsViewController)?.article = articlesCoreFavorite[indexPath.row]
                tableView.deselectRow(at: indexPath , animated: true)
            }
        }
    }
}
