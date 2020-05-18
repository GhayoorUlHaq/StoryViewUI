//
//  ViewController.swift
//  StoryViewUI
//
//  Created by Ghayoor ul Haq on 17/05/2020.
//  Copyright © 2020 Ghayoor ul Haq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // lets avoid polluting view did load
    let bearImgeView: UIImageView = {
        let imageView = UIImageView(image:#imageLiteral(resourceName: "bear_first"))
        
        // enable autolayout to add custom constraits
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
      let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in out fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        let anotherattributedText = NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun! Don't wait any longer! We hope to see you in our stores soon!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        attributedText.append(anotherattributedText)
        textView.attributedText = attributedText

        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
        
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .secondPink
        return pc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
    
        setupLayout()
        setupButtonController()
        
        
    }
    
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
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)

        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImgeView)
        bearImgeView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImgeView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImgeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImgeView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }


}
//MARK: - UIColors
extension   UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var secondPink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

