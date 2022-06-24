//
//  PageViewController.swift
//  LoNews
//
//  Created by Артем Лодыгин on 22.06.2022.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var articlesCore = takeNews(at: articles)
    
    @IBAction func refreashControllAction(_ sender: Any) {
        loadNews {
            self.articlesCore = takeNews(at: articles)
            self.showViewControllers()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        self.showViewControllers()
        
        loadNews {
            self.articlesCore = takeNews(at: articles)
            self.showViewControllers()
        }
    }
    
    func showViewControllers(){
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0){
                self.setViewControllers([vc], direction: .forward, animated: false)
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) - 1
        
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) + 1
        
        return self.pageViewController(for: index)
    }
    
    func pageViewController(for index : Int)  -> OneNewsViewController? {
        
        if index < 0 {
            return nil
        }
        
        if index >= articles.count {
            return nil
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "OneNewsSID") as! OneNewsViewController

        vc.article = articlesCore[index]
        
        vc.index = index
        
        return vc
    }
    

}
