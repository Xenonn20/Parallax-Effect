//
//  ViewController.swift
//  Parallax Effect
//
//  Created by Кирилл Медведев on 09.11.2019.
//  Copyright © 2019 Kirill Medvedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

    
    private func setupScrollView() {
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(images.count)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.bounces = false
        
        for (i, image) in images.enumerated() {
            let view = ParallaxView()
            
            view.frame = CGRect(x: self.scrollView.frame.width * CGFloat(i),
                                y: 0,
                                width: self.scrollView.frame.width,
                                height: self.scrollView.frame.height)
            view.imageView.image = image
            view.tag = i + 10
            self.scrollView.addSubview(view)
        }
        
        
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tempo = 200 / scrollView.frame.width
        
        for i in 0 ..< images.count {
            let parallaxView = scrollView.viewWithTag(i + 10) as! ParallaxView
            let newX: CGFloat = tempo * (scrollView.contentOffset.x - CGFloat(i) * scrollView.frame.width)
            
            parallaxView.imageView.frame = CGRect(x: newX,
                                                  y: parallaxView.imageView.frame.origin.y,
                                                  width: parallaxView.imageView.frame.width,
                                                  height: parallaxView.imageView.frame.height)
        }
    }
}

