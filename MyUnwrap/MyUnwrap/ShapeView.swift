//
//  ShapeView.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/17.
//

import UIKit
//使用贝斯尔曲线画图形
class ShapeView: UIView {

    var strokeWidth: CGFloat = 2.0
    
    var strokeColor: UIColor = UIColor.black 
    
    var fillColor: UIColor = .clear
    //指定路径
    var path: UIBezierPath?
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let layer = self.layer as? CAShapeLayer  else {
            return
        }
        
        let multiplier = min(bounds.width, bounds.height)
        
        guard let pathCopy = path?.copy() as? UIBezierPath else {
            return
        }
        
        pathCopy.apply(CGAffineTransform(scaleX: multiplier, y: multiplier))
        
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.lineWidth = strokeWidth
        layer.path = pathCopy.cgPath
    }
    
    func draw(delay: CFTimeInterval, duration: Double, keyFrameValues values:[NSNumber]) {
        guard let layer = self.layer as? CAShapeLayer else { return }
        layer.strokeEnd = 0
        
        let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
        animation.beginTime = CACurrentMediaTime() + delay
        animation.values = values
        animation.keyTimes = values
        animation.duration = duration
        animation.timingFunctions = (1...values.count).map({ _ in
            CAMediaTimingFunction(name: .easeInEaseOut)
            
        })
        
        animation.fillMode = .backwards
        layer.add(animation, forKey: "line")
        
        layer.strokeEnd = 1
    }

}
