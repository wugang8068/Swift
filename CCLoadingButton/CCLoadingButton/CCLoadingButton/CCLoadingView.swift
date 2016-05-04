//
//  CCLoadingView.swift
//  animate
//
//  Created by CatStandInTheCorner on 16/5/4.
//  Copyright © 2016年 chart. All rights reserved.
//

import UIKit

class CCLoadingView: UIView {
    
    // MARK: - Public Property
    var strockColor = UIColor.greenColor(){
        didSet{
            self.loadingLayer.strokeColor = strockColor.CGColor;
        }
    }
    
    var lineWidth:CGFloat = 1{
        didSet{
            self.loadingLayer.lineWidth = lineWidth
        }
    }
    
    var duration:CFTimeInterval = 1.5{
        didSet{
            self.startAnimate();
        }
    }
    
    var timeFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    // MARK: - Private Property
    private let rotateAnimationKey = "rotateAnimationKey";
    private let groupAnimationKey  = "groupAnimationKey"
    
    lazy var loadingLayer:CAShapeLayer = {
        let layer = CAShapeLayer();
        layer.strokeColor = self.strockColor.CGColor;
        layer.fillColor   = nil
        layer.lineWidth   = self.lineWidth;
        return layer;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(loadingLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.loadingLayer.frame.size = self.frame.size
        self.updateLayerPath()
    }
    
    // MARK: - Public Function
    
    func stopAnimate(){
        self.loadingLayer.removeAllAnimations();
        self.hidden = true;
    }
    
    func startAnimate(){
        self.hidden = false;
        self.loadingLayer.removeAllAnimations();
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration  = self.duration / 0.375;
        animation.fromValue = 0
        animation.toValue   = 2 * M_PI;
        animation.repeatCount = Float.infinity
        animation.removedOnCompletion = false
        self.loadingLayer.addAnimation(animation, forKey: rotateAnimationKey);
        
        let headAnimation = CABasicAnimation(keyPath: "strokeStart")
        headAnimation.duration = self.duration / 1.5
        headAnimation.fromValue = 0
        headAnimation.toValue   = 0.25
        headAnimation.timingFunction = timeFunction;
        
        let tailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailAnimation.duration = self.duration / 1.5
        tailAnimation.fromValue = 0
        tailAnimation.toValue   = 1
        tailAnimation.timingFunction = timeFunction;
        
        let endHeadAnimation = CABasicAnimation(keyPath: "strokeStart")
        endHeadAnimation.beginTime = self.duration / 1.5
        endHeadAnimation.duration = self.duration / 3.0
        endHeadAnimation.fromValue = 0.25
        endHeadAnimation.toValue   = 1
        endHeadAnimation.timingFunction = timeFunction;
        
        let endTailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endTailAnimation.beginTime = self.duration / 1.5
        endTailAnimation.duration = self.duration / 3.0
        endTailAnimation.fromValue = 1
        endTailAnimation.toValue   = 1
        endTailAnimation.timingFunction = timeFunction;
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [headAnimation,tailAnimation,endHeadAnimation,endTailAnimation]
        animationGroup.duration = self.duration;
        animationGroup.repeatCount = Float.infinity
        animationGroup.removedOnCompletion = false
        self.loadingLayer.addAnimation(animationGroup, forKey: groupAnimationKey)
    }
    
    // MARK: - Private Function
    private func updateLayerPath(){
        let layerWidthHeight = min(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        let center           = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        self.loadingLayer.path = UIBezierPath(arcCenter: center, radius: (layerWidthHeight - self.lineWidth) / 2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).CGPath;
        self.loadingLayer.strokeStart = 0;
        self.loadingLayer.strokeEnd   = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
