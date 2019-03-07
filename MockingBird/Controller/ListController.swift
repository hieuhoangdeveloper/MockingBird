//
//  ListController.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import UIKit
import RealmSwift


class ListController: UITableViewController {
    
    let realm = try! Realm()
    
    var newsFeedItems: Results<Item>?
    
    
    var selectedCategory : Category?
    {
        didSet{
            loadNewsFeed()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 500
        
        loadNewsFeed()
        
    }
    
    
    //MARK: - Tableview Datasource 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        
        if let item = newsFeedItems?[indexPath.row] {
            
            
            
            cell.wordLabel?.text = item.word
            
            cell.newsFeedTextView?.text = item.wordDescription
            
            cell.newsFeedImageView.image = UIImage(data: item.imageView! as Data)
            
            
            
        }
        
        
        
        return cell
    }
    
    
    
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    //MARK: - TableView Animation
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    
    
    
    //MARK: - Load News Feed
    
    func loadNewsFeed() {
        
        newsFeedItems = selectedCategory?.items.sorted(byKeyPath: "word", ascending: true)
        
        tableView.reloadData()
        
    }
    
    
    
}




