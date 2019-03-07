//
//  Item.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var imageView: NSData?
    @objc dynamic var word: String = ""
    @objc dynamic var wordDescription: String = ""
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
