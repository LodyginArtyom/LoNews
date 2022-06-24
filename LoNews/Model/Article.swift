//
//  Article.swift
//  LoNews
//
//  Created by Артем Лодыгин on 20.06.2022.
//

import Foundation
/*
 "id": "abc-news",
 "name": "ABC News",
 "description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
 "url": "https://abcnews.go.com",
 "category": "general",
 "language": "en",
 "country": "us"
 */

struct Article{
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    var favorites: Bool = false
    
    init(dictionary: Dictionary<String, Any>){
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["sourse"] as? Dictionary<String, Any> ?? ["": ""])["name "] as? String ?? ""
    }
}
