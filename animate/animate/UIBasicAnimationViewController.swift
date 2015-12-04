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
    

    
    @IBAction func basicAnimation(sender: UIButton) {
        //keyPath:  frame  frame.size  frame.orign opacity  position等layer的属性KVC值
        let animation = CABasicAnimation(keyPath: "bounds.size");
        animation.fromValue   = NSValue(CGSize: CGSizeMake(0, 0));
        animation.toValue     = NSValue(CGSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT))
        animation.byValue      = NSValue(CGSize: CGSizeMake(200, 200));
        animation.duration  = 4.0;
        animation.autoreverses = true;
        /**
        *  以下两行表示动画结束以后保持结束的状态
        */
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = false;
        
        self.basicAnimationView.layer.addAnimation(animation, forKey: nil);
    }
    
    
    @IBAction func keyFrameAnimation(sender: UIButton) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
