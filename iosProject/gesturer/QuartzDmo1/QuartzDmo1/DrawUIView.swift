//
//  DrawUIView.swift
//  QuartzDmo1
//
//  Created by Groom on 2019/5/15.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class DrawUIView: UIView {

    var firstTouchLocatio = CGPoint.zero
    var lastTouchLocation = CGPoint.zero
    var currentRect = CGRect.zero
    var redrawRect = CGRect.zero

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstTouchLocatio = (touches.first?.location(in: self))!
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchLocation = (touches.first?.location(in: self))!
        currentRect = CGRect(x: firstTouchLocatio.x, y: firstTouchLocatio.y, width: lastTouchLocation.x-firstTouchLocatio.x, height: lastTouchLocation.y-firstTouchLocatio.y)
        redrawRect = redrawRect.union(currentRect)
        setNeedsDisplay(redrawRect)
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(lastTouchLocation)
        print((touches.first?.location(in: self))!)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //<#code#>
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setFillColor(UIColor.blue.cgColor)
        context?.addRect(currentRect)
        context?.addEllipse(in: currentRect)
//        context?.addLine(to: lastTouchLocation)
        context?.drawPath(using: .fillStroke)
        
    }

}
