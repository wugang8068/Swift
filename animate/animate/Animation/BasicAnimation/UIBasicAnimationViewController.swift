//
//  UIBasicAnimationViewController.swift
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit

class UIBasicAnimationViewController: BaseViewController {

    @IBOutlet weak var basicAnimationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSBundle.mainBundle().loadNibNamed("UIBasicAnimationViewController", owner: self, options: nil);
        self.title = "Basic Animation";
        
    }
    

    /**
     基本动画
     
     - parameter sender: <#sender description#>
     */
    @IBAction func basicAnimation(sender: UIButton) {
        //keyPath:  frame  frame.size  frame.orign opacity  position等layer的属性KVC值
        let animation = CABasicAnimation(keyPath: "bounds.size");
        animation.fromValue   = NSValue(CGSize: CGSizeMake(0, 0));
        animation.toValue     = NSValue(CGSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT))
        animation.byValue      = NSValue(CGSize: CGSizeMake(200, 200));
        animation.duration  = 4.0;
        //是否可以逆向执行动画
        animation.autoreverses = true;
        /**
        *  以下两行表示动画结束以后保持结束的状态
        */
        //animation.fillMode = kCAFillModeForwards;
        //animation.removedOnCompletion = false;
        
        self.basicAnimationView.layer.addAnimation(animation, forKey: nil);
    }
    
    /**
     关键帧动画
     
     - parameter sender: <#sender description#>
     */
    @IBAction func keyFrameAnimation(sender: UIButton) {
        let animation = CAKeyframeAnimation(keyPath: "position");
        /// 圆形路径
        let path      = UIBezierPath(ovalInRect: CGRectMake(SCREEN_WIDTH/2 - 100, SCREEN_HEIGHT/2 - 100, 200, 200));
        animation.path = path.CGPath;
        animation.duration = 4;
        self.basicAnimationView.layer.addAnimation(animation, forKey: "pathAnimation");
        
    }
    
    /**
     组动画
     
     - parameter sender: <#sender description#>
     */
    @IBAction func groupAnimation(sender: UIButton) {
        let animation = CAKeyframeAnimation(keyPath: "position");
        let value0    = NSValue(CGPoint: CGPointMake(0, SCREEN_HEIGHT/2 - 50));
        let value1    = NSValue(CGPoint: CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2 - 50));
        let value2    = NSValue(CGPoint: CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2 + 50));
        let value3    = NSValue(CGPoint: CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2 + 50));
        let value4    = NSValue(CGPoint: CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2 - 50));
        let value5    = NSValue(CGPoint: CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2 - 50));
        animation.values = [value0,value1,value2,value3,value4,value5];
        
        let animation2 = CABasicAnimation(keyPath: "transform.scale");
        animation2.fromValue    = NSNumber(float: 0.8);
        animation2.toValue      = NSNumber(float: 2.0);
        
        let animation3 = CABasicAnimation(keyPath: "transform.rotation");
        animation3.toValue      = NSNumber(float: Float(M_PI) * 4.0);
        
        let groupAnimation  = CAAnimationGroup();
        groupAnimation.animations = [animation,animation2,animation3];
        
        groupAnimation.duration = 4;
        
        self.basicAnimationView.layer.addAnimation(groupAnimation, forKey: nil);
    }
    
    /**
     过渡动画
     
     - parameter sender: <#sender description#>
     */
    @IBAction func transitionAnimation(sender: UIButton) {
        let animation = CATransition()
        //oglFlip:翻转, subtType:kCATransitionFromBottom kCATransitionFromTop上下翻转 kCATransitionFromLeft kCATransitionFromRight左右翻转
        //pageCurl:向上翻一页   pageUnCurl:向下翻一页  rippleEffect:滴水效果 suckEffect:收缩效果，如一块布被抽走   cube:立方体效果
        //kCATransitionFade   交叉淡化过渡
        //kCATransitionMoveIn 新视图移到旧视图上面
        //kCATransitionPush   新视图把旧视图推出去
        //kCATransitionReveal 将旧视图移开,显示下面的新视图
        //
        animation.type = "oglFlip";
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut);
        animation.subtype = kCATransitionFromLeft;
        animation.duration = 0.8;
        self.basicAnimationView.layer.addAnimation(animation, forKey: nil);
    }
    

}
