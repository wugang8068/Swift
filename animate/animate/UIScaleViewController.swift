//
//  UIScaleViewController.swift
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit

class UIScaleViewController: BaseViewController {

    @IBOutlet weak var scaleView: UIScaleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSBundle.mainBundle().loadNibNamed("UIScaleViewController", owner: self, options: nil);
        self.title = "Scale";
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.scaleView.center = touches.first!.locationInView(self.view);
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.scaleView.center = touches.first!.locationInView(self.view);
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
