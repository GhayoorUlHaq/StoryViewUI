//
//  SwipingController.swift
//  StoryViewUI
//
//  Created by Ghayoor ul Haq on 18/05/2020.
//  Copyright © 2020 Ghayoor ul Haq. All rights reserved.
//

import UIKit
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us for the fun!", bodyText: "This is exactly for what we were talking about. Yeh!"),
        Page(imageName: "heart_second", headerText: "We'll get much more then that!", bodyText: "Just subscribe to the channel and you are good to go."),
        Page(imageName: "leaf_third", headerText: "VIP Premier services are for you!", bodyText: "Exclusive Offer is there for you, enjoy you best!"),
        Page(imageName: "bear_first", headerText: "Join us for the fun!", bodyText: "This is exactly for what we were talking about. Yeh!"),
        Page(imageName: "heart_second", headerText: "We'll get much more then that!", bodyText: "Just subscribe to the channel and you are good to go."),
        Page(imageName: "leaf_third", headerText: "VIP Premier services are for you!", bodyText: "Exclusive Offer is there for you, enjoy you best!")
    ]
    
    private let previousButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    
    
    private let nextButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .secondPink
        return pc
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupButtonController()
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
}

//MARK: - Managing Events
extension SwipingController {
    // Managing page controll when someone swipe the pages
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
    
    // handling Next button
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1 )
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // Handling Prev button
    @objc private func handlePrev(){
        let nextIndex = max(pageControl.currentPage - 1, 0 )
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

//MARK: - Layout Controls
extension SwipingController {
    private func setupButtonController() {
        let buttomControllStackView = UIStackView(arrangedSubviews: [
            previousButton, pageControl, nextButton
        ])
        buttomControllStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControllStackView.distribution = .fillEqually
        
        view.addSubview(buttomControllStackView)
        NSLayoutConstraint.activate([
            buttomControllStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomControllStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomControllStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControllStackView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}

//MARK: - Buttom Controll
extension SwipingController {
    
    //space between each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // total number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //    Providing the exact cell to display
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return  cell
    }
    
    // set the size of each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

//MARK: - UIColors
extension   UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var secondPink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

