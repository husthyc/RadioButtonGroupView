//
//  SimpleCircleView.swift
//  RadioButtonDemo
//
//  Created by Yuchen Huang on 4/5/19.
//  Copyright © 2019 Yuchen Huang. All rights reserved.
//

import UIKit

class SimpleCircleView: UIView {
    
    /// properties
    var innerRadius: CGFloat = 5.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var fillingColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    var circleColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let centerX = rect.origin.x + rect.size.width / 2
        let centerY = rect.origin.y + rect.size.height / 2
        let radius = min(rect.size.width, rect.size.height) / 2
        
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                                radius: (radius + innerRadius) / 2 - 1,
                                startAngle: 0,
                                endAngle: CGFloat(2 * Float.pi),
                                clockwise: true)
        fillingColor.setFill()
        path.fill()
        
        path.lineWidth = radius - innerRadius
        circleColor.setStroke()
        path.stroke()
    }
    
}
