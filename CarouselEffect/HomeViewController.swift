//
//  HomeViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var interests = Interest.creatInterest()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 400)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.register(UINib(nibName: "WSCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WSCollectionViewCell
        cell.interest = interests[indexPath.row]
        return cell
    }
}
