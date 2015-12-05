//
//  CCAnimationView.swift
//  CCAnimation
//
//  Created by CatStandInTheCorner on 15/12/5.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit
import Foundation

protocol CCAnimationViewProtocol:NSObjectProtocol{
    
    
    func startAnimation();
    func stopAnimation();
}

class CCAnimationView: UIView,CCAnimationViewProtocol {
    
    var value:NSNumber?{
        didSet{
            self.prepareAnimations();
        }
    }
    var textColor:UIColor?
    lazy var textFont:UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize());
    var duration:CFTimeInterval = 1.5;
    var durationOffset:CFTimeInterval = 0.2;
    /// 比重
    var density:Int = 5;
    var minLength = 0;
    /// 是否上升
    var isAscending:Bool? = false;
    
    private lazy var numbersText = [String]();
    private lazy var scrollLayers = [CAScrollLayer]()
    private lazy var scrollLabels = [UILabel]()
    private let ANIMATION_KEY_NAME = "CCAnimationName"
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.initFrame();
    }
    
    
    private func initFrame(){
        
    }
    
    func startAnimation() {
        self.prepareAnimations();
        self.createAnimations();
    }
    
    func stopAnimation() {
        for layer in scrollLayers{
            layer.removeAnimationForKey(ANIMATION_KEY_NAME);
        }
    }
    
    private func createAnimations(){
        let duration:CFTimeInterval = self.duration - CFTimeInterval(self.numbersText.count) * self.durationOffset;
        var offset:CFTimeInterval   = 0;
        
        for scrollLayer in self.scrollLayers{
            let maxY:CGFloat? = scrollLayer.sublayers?.last?.frame.origin.y;
            let animation = CABasicAnimation(keyPath: "sublayerTransform.translation.y");
            animation.duration = duration + offset;
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            if self.isAscending == true{
                animation.fromValue = NSNumber(float: -Float(maxY!));
                animation.toValue   = 0;
            }else{
                animation.fromValue = 0;
                animation.toValue   = NSNumber(float: -Float(maxY!));
            }
            
            scrollLayer.addAnimation(animation, forKey: ANIMATION_KEY_NAME)
            offset += self.durationOffset;
        }
    }
    
    private func prepareAnimations(){
        for layer in self.scrollLayers{
            layer.removeFromSuperlayer();
        }
        numbersText.removeAll();
        scrollLayers.removeAll();
        scrollLabels.removeAll();
        self.createNumbersText();
        self.createScrollLayers();
    }
    
    private func createNumbersText(){
        if let textValue = self.value?.stringValue{
            if self.minLength > textValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding){
                for _ in 0..<self.minLength - textValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding){
                    self.numbersText.append("0");
                }
            }
            for i in 0..<textValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding){
                self.numbersText.append((textValue as NSString).substringWithRange(NSMakeRange(i, 1)));
            }
        }
    }
    
    private func createScrollLayers(){
        let width:CGFloat = self.frame.width / CGFloat(self.numbersText.count)
        let height = self.frame.height;
        
        for i in 0..<self.numbersText.count{
            let layer:CAScrollLayer = CAScrollLayer();
            layer.frame = CGRectMake(width * CGFloat(i), 0, width, height);
            self.scrollLayers.append(layer);
            self.layer.addSublayer(layer);
        }
        
        for i in 0..<self.numbersText.count{
            let layer = self.scrollLayers[i];
            let numberText = self.numbersText[i];
            self.createContentForLayer(layer, text: numberText);
        }
    
    }
    
    private func createContentForLayer(scrollLayer:CAScrollLayer,text:String){
        let number = (text as NSString).integerValue;
        var textForScroll = [String]();
        for i in 0..<self.density + 1{
            textForScroll.append(NSString(format: "%ld", (number + i) % 10) as String);
        }
        textForScroll.append(text);
        
        if self.isAscending == false{
            textForScroll = textForScroll.reverse();
        }
        var height:CGFloat = 0;
        
        for text in textForScroll{
            let textLabel = self.createLabel(text);
            textLabel.frame = CGRectMake(0, height, scrollLayer.frame.width, scrollLayer.frame.height);
            scrollLayer.addSublayer(textLabel.layer);
            scrollLabels.append(textLabel);
            height = CGRectGetMaxY(textLabel.frame);
        }
        
    }
    
    /**
     创建Label
     
     - parameter text: <#text description#>
     
     - returns: <#return value description#>
     */
    private func createLabel(text:String) -> UILabel{
        let label = UILabel();
        label.textColor = self.textColor;
        label.font = self.textFont;
        label.textAlignment = .Center;
        label.text = text;
        return label;
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.initFrame();
    }
    
}
