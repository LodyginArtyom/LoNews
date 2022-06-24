//
//  Model.swift
//  LoNews
//
//  Created by Артем Лодыгин on 20.06.2022.
//

import Foundation
import UIKit
import CoreData

var articlesCore: [ArticlesCore] = []

 var articles: [Article] {
    
    
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil{
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray : [Article] = []
        
        for dict in array{
            let newArticles = Article(dictionary: dict)
            returnArray.append(newArticles)
        }
        
        return returnArray
    }
    
    return []
}

var urlToData : URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a91c843384cd49bf944825b7fd10c604
func loadNews(complitionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a91c843384cd49bf944825b7fd10c604")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { urlFile, responce, error in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            complitionHandler?()
            
        }
        
    }
    downloadTask.resume()

    
}

    



