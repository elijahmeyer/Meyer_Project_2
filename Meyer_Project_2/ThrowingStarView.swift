//
//  ThrowingStarView.swift
//  Meyer_Project_2
//
//  Created by administrator on 10/29/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit

class ThrowingStarView : UIView {
    var offset = 0
    var directionChange = 6
    var radius = 60
    @IBOutlet var throwButton : UIButton?
    
    func update() {
        if (offset + radius >= Int(bounds.origin.x + bounds.size.width * 0.5) || offset - radius <= Int(bounds.origin.x - bounds.size.width * 0.5)) {
            directionChange = directionChange * -1
        }
        offset = offset + directionChange
        setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.017) {
           self.update()
        }
    }
    
    override func awakeFromNib() {
        update()
    }
    
    override func draw(_ rect: CGRect) {
        let dx = bounds.origin.x + 0.5 * bounds.size.width
        let dy = bounds.origin.y + 0.15 * bounds.size.height
        let path = UIBezierPath(arcCenter: CGPoint(x: dx, y: dy), radius: CGFloat(radius), startAngle: 0, endAngle: CGFloat.pi * 2.0, clockwise: true)
        
        UIColor.red.setFill()
        
        
        let t = CGAffineTransform(translationX: CGFloat(integerLiteral: offset), y: 0)
        path.apply(t)
        path.fill()
    }
}
