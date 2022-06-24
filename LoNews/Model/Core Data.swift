//
//  Core Data.swift
//  LoNews
//
//  Created by Артем Лодыгин on 25.06.2022.
//

import Foundation
import CoreData
import UIKit

var newsInCoreData : [ArticlesCore] = []

func takeNews(at articles: [Article])->[ArticlesCore]{
//    loadNews {
//    }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    guard let enity = NSEntityDescription.entity(forEntityName: "ArticlesCore", in: context) else {return []}
    
    
    let fetchRequest : NSFetchRequest<ArticlesCore> = ArticlesCore.fetchRequest()
    
    do {
         newsInCoreData = try! context.fetch(fetchRequest)
    }catch let error as NSError{
        print(error.localizedDescription)
    }
    for news in articles {
        let context = appDelegate.persistentContainer.viewContext
        let newsObjects = ArticlesCore(entity: enity, insertInto: context)
        newsObjects.title = news.title
        newsObjects.content = news.description
        newsObjects.url = news.url
        newsObjects.urlImage = news.urlToImage
        newsObjects.author = news.author
        newsObjects.favorite = news.favorites
        
        if (newsInCoreData.first(where: {$0.title == newsObjects.title} ) != nil){
            context.delete(newsObjects)
            break
        }else{
            do{
                try context.save()
            }catch let error as NSError{
                print(error.localizedDescription)
            }
        }
    }
    return newsInCoreData
}
