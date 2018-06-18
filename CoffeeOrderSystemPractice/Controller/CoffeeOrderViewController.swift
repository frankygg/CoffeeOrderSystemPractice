//
//  ViewController.swift
//  CoffeeOrderSystemPractice
//
//  Created by BoTingDing on 2018/6/18.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import UIKit

class CoffeeOrderViewController: UIViewController {

    //local var
    var selectedItemViewController: SelectedItemViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "item" {
            if let viewController = segue.destination as? ItemViewController {
            viewController.delegate = self
            }
        }
        if segue.identifier == "selectedItem" {
            if let viewController = segue.destination as? SelectedItemViewController {
                selectedItemViewController = viewController
            }
        }
    }


}

extension CoffeeOrderViewController: ItemViewDelegate {
    func deliverItem(_ sender: ItemCollectionViewCell?, _ selectedItem: Item) {
        print(selectedItem)
        selectedItemViewController.selectedItem.append(selectedItem)
//        selectedItemViewController.selectedItemTableView.reloadData()
    }
    
    
}

