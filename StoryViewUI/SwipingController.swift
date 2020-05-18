//
//  SwipingController.swift
//  StoryViewUI
//
//  Created by Ghayoor ul Haq on 18/05/2020.
//  Copyright © 2020 Ghayoor ul Haq. All rights reserved.
//

import UIKit
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad(){
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set the size of each cell
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
