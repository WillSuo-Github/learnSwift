//
//  ViewController.swift
//  collectionViewAnimation
//
//  Created by ws on 2016/10/13.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myCollectionView: UICollectionView?
    var imageCollection: AnimationImageCollection?
    var currentIndex: IndexPath?
    var pushVc: WSViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageCollection = AnimationImageCollection()
        
        myCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10;
            layout.minimumInteritemSpacing = 10;
            layout.itemSize = CGSize(width: 340, height: 210)
            let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
            collection.delegate = self
            collection.dataSource = self
            collection.register(UINib(nibName: "AnimationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimationCollectionViewCell")
            collection.backgroundColor = .green
            view.addSubview(collection)
            return collection
        }()
    }
    
    fileprivate func handlerCollectionDidSelectCell(collection: UICollectionView, cell: UICollectionViewCell) {
        pushVc = WSViewController()
        pushVc!.viewModel = self.imageCollection?.images[(currentIndex?.row)!]
        navigationController?.delegate = pushVc
        navigationController?.pushViewController(pushVc!, animated: true)
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimationCollectionViewCell", for: indexPath) as? AnimationCollectionViewCell , let viewModel = imageCollection?.images[indexPath.row] else{
            return UICollectionViewCell()
        }
        cell.prepareCell(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath as IndexPath) as? AnimationCollectionViewCell else {
            return
        }
        currentIndex = indexPath
        handlerCollectionDidSelectCell(collection: collectionView, cell: cell)
    }
    
    
}
//
//extension ViewController: UINavigationControllerDelegate {
//    
//    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print(operation)
//        if operation == .Push{
//            return CustomAnimation(type: .push)
//        }else{
//            return CustomAnimation(type: .pop)
//        }
//    }
//}

