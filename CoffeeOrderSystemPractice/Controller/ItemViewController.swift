//
//  ItemViewController.swift
//  CoffeeOrderSystemPractice
//
//  Created by BoTingDing on 2018/6/18.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import UIKit
import SDWebImage

class ItemViewController: UIViewController {

    //local var
    var items: [Item] = []
    weak var delegate: ItemViewDelegate?
    
    //IBOutlet var
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseManager.shared.loadItems(completion: { [weak self] items in
            self?.items = items
            self?.collectionView.reloadData()
            print(items)
        })
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: ItemCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ItemCollectionViewCell.self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ItemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    // 滑動方向為「垂直」的話即「上下」的間距(預設為重直)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // 滑動方向為「垂直」的話即「左右」的間距(預設為重直)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if self.view.frame.size.width > 320 {
            return 5
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if self.view.frame.size.width > 320 {
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        } else {
            return UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("frame width \(self.view.frame.size)")
        if self.view.frame.size.width > 320 {
            return CGSize(width: (self.view.frame.size.width - 15) / 5, height: (self.view.frame.size.height - 30) / 2)
        } else {
            return CGSize(width: (self.view.frame.size.width) / 5, height: (self.view.frame.size.height - 30) / 2)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCollectionViewCell.self), for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.delegate = self
        cell.coffeeImageView.sd_setImage(with: URL(string: items[indexPath.row].image), completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
        delegate?.deliverItem(nil, items[indexPath.row])
    }

}

protocol ItemViewDelegate: class {
    func deliverItem(_ sender: ItemCollectionViewCell?, _ selectedItem: Item)
}

