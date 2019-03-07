//
//  PopupDelegate.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import UIKit

protocol PopupDelegate {
    func popValueSelected(word: String, image: NSData, description: String)
}

extension ListController: PopupDelegate {
    func popValueSelected(word: String, image: NSData, description: String) {
        if let currentCategory = self.selectedCategory {
            do {
                try self.realm.write {
                    let newItem = Item()
                    newItem.word = word
                    newItem.wordDescription = description
                    newItem.imageView = image
                    
                    
                    currentCategory.items.append(newItem)
                }
            } catch {
                print("Error saving new items, \(error)")
            }
        }
        
        self.tableView.reloadData()
        
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToPopup" {
            
            let destinationVC = segue.destination as! PopupController
            
            
            destinationVC.delegate = self
            
        }
        
        
        
    }
    
    
    
    
    
}
