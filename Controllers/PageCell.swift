//
//  PageCell.swift
//  StoryViewUI
//
//  Created by Ghayoor ul Haq on 18/05/2020.
//  Copyright © 2020 Ghayoor ul Haq. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {
    
    var page: Page? {
        // if page is set then call this
        didSet {
            
//            to gard the optional ones
            guard page != nil else {
                return
            }
            
            bearImgeView.image = UIImage(named: page!.imageName)
            
            let attributedText = NSMutableAttributedString(string: page!.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

            let anotherattributedText = NSMutableAttributedString(string: "\n\n\(page!.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            attributedText.append(anotherattributedText)
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImgeView: UIImageView = {
        let imageView = UIImageView(image:#imageLiteral(resourceName: "bear_first"))
        
        // enable autolayout to add custom constraits
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
      let textView = UITextView()        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Setup Layout
extension PageCell {
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)

        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImgeView)
        bearImgeView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImgeView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImgeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImgeView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
}
