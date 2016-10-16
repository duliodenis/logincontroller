//
//  PageCell.swift
//  Login
//
//  Created by Dulio Denis on 10/16/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let page = page else {
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let fontColor = UIColor(red: 28/255, green: 42/255, blue: 57/255, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title,
                                                    attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24, weight: UIFontWeightMedium),
                                                                 NSForegroundColorAttributeName: fontColor])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName: fontColor]))
            
            // Center Text in TextView
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let stringLength = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: stringLength))
            
            textView.attributedText = attributedText
    
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "Page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.text = "Walkthrough"
        tv.isEditable = false
        
        // Give it some space from the top
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
        return tv
    }()
    
    let lineSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(lineSeperatorView)
        addSubview(textView)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        lineSeperatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
}
