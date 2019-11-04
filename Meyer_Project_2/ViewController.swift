//
//  ViewController.swift
//  Meyer_Project_2
//
//  Created by administrator on 10/29/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleView : UIView!
    @IBOutlet var throwingStarView: UIView!
    var throwingStar = UIImage(named: "ninja-star.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let array = self.titleView!.subviews
        for item in array {
            if item is UILabel {
                UIView.animate(withDuration: 2, delay: 0.5, options: [], animations: {
                    item.alpha = 1
                }, completion: nil)
            }
        }
    }
        
    @IBAction func changeView() {
        UIView.transition(from: titleView, to: throwingStarView, duration: 1, options: .transitionFlipFromRight, completion: nil)
    }

    @IBAction func throwStar(sender: UIButton) {
        let thrownStar = UIImageView(image: throwingStar)
        thrownStar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        thrownStar.center = CGPoint(x: self.throwingStarView.bounds.origin.x + 0.5 * self.throwingStarView.bounds.size.width, y : self.throwingStarView.bounds.size.height)
        
        throwingStarView.addSubview(thrownStar)
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            thrownStar.center = CGPoint(x: self.throwingStarView.bounds.origin.x + 0.5 * self.throwingStarView.bounds.size.width, y : self.throwingStarView.bounds.origin.y)
            
            let rotationTransform = CABasicAnimation(keyPath: "transform.rotation")
            rotationTransform.fromValue = 0
            rotationTransform.toValue = CGFloat.pi * 2
            rotationTransform.duration = 1
            rotationTransform.repeatCount = Float.infinity
            
            thrownStar.layer.add(rotationTransform, forKey: "rotation")
            
            
        }, completion: { (Bool) in
            thrownStar.removeFromSuperview()
        })
    }
}

