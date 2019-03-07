//
//  SwipeTableCell+Extension.swift
//  MockingBird
//
//  Created by Kim Page on 3/7/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import UIKit
import SwipeCellKit

extension CategoryController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            
            if let categoryForDeletion = self.categories?[indexPath.row] {
                
                do {
                    try self.realm.write {
                        self.realm.delete(categoryForDeletion)
                    }
                    
                } catch {
                    print("Error deleting category, \(error)")
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    
    
    
}


