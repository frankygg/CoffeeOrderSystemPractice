//
//  FirebaseManager.swift
//  CoffeeOrderSystemPractice
//
//  Created by BoTingDing on 2018/6/18.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager{
    static let shared = FirebaseManager()
    
    lazy var ref = Database.database().reference()

    func loadItems(completion: @escaping ([Item]) -> Void) {
        ref.child("items").observe(.value, with: { snapshot in
            
            DispatchQueue.main.async {
                var items = [Item]()
               
                guard let values = snapshot.value as? [NSObject] else {
                    completion(items)
                    return
                }
                
                for value in values {
                    guard let obj = value as? NSDictionary else {
                        return
                    }
                    let item = Item(image: (obj.object(forKey: "image") as? String)!, name: (obj.object(forKey: "name") as? String)!, price: (obj.object(forKey: "price") as? Int)!)
                    items.append(item)
                              print(obj)
                }
                completion(items)
            }
        })
    }
}
