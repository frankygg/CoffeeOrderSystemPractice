//
//  SelectedItemViewController.swift
//  CoffeeOrderSystemPractice
//
//  Created by BoTingDing on 2018/6/18.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import UIKit
import SDWebImage

class SelectedItemViewController: UIViewController {

    
    //local var
    var selectedItem: [Item] = [] {
        didSet {
            selectedItemTableView.reloadData()
        }
    }
    
    //IBOutlet var
    @IBOutlet weak var selectedItemTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItemTableView.delegate = self
        selectedItemTableView.dataSource = self
        selectedItemTableView.register(UINib(nibName: String(describing: SelectedItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectedItemTableViewCell.self))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SelectedItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectedItemTableViewCell.self), for: indexPath) as? SelectedItemTableViewCell else {
            return UITableViewCell()
        }
        cell.selectedItemImageView.sd_setImage(with: URL(string: selectedItem[indexPath.row].image), completed: nil)
        cell.itemLabel.text = selectedItem[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.selectedItem.remove(at: indexPath.row)
            self.selectedItemTableView.reloadData()
        }
    }
    
    
}
