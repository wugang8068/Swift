//
//  ViewController.swift
//  CCLoadingButton
//
//  Created by CatStandInTheCorner on 16/5/4.
//  Copyright © 2016年 Che300. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var animateButton:CCLoadingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: CGRectMake(100, 150 , self.view.frame.width - 200, 30))
        
        btn.setTitle("动画1", forState: UIControlState.Normal)
        
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        btn.addTarget(self, action: #selector(startAnimate), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn)
        
        let btn2 = UIButton(frame: CGRectMake(100, 180 , self.view.frame.width - 200, 30))
        
        btn2.setTitle("动画2", forState: UIControlState.Normal)
        
        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        btn2.addTarget(self, action: #selector(startAnimate2), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn2)
        
        animateButton = CCLoadingButton(frame: CGRectMake(20, btn2.frame.origin.y + btn2.frame.size.height + 20 , self.view.frame.width - 40, 60), title: "测试")
        self.view.addSubview(animateButton)
    }
    
    func startAnimate2(){
        if animateButton.isLoading == true{
            animateButton.buttonState = .Success
            animateButton.stopLoading("登录成功");
        }else{
            animateButton.buttonState = .Default
            animateButton.startLoading("登录中")
        }
    }
    
    
    func startAnimate(){
        if animateButton.isLoading == true{
            animateButton.buttonState = .Error
            animateButton.stopLoading("登录失败");
        }else{
            animateButton.buttonState = .Default
            animateButton.startLoading("登录中")
        }
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

