//
//  ParallaxView.swift
//  Parallax Effect
//
//  Created by Кирилл Медведев on 09.11.2019.
//  Copyright © 2019 Kirill Medvedev. All rights reserved.
//

import UIKit

class ParallaxView: UIView {
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        layer.borderWidth = 0.5
        layer.backgroundColor = UIColor.black.cgColor
        layer.masksToBounds = true
        backgroundColor = .white
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
