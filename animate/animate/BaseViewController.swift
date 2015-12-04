//
//  BaseViewController.swift
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        // Do any additional setup after loading the view.
    }
    
    func setRightBarButtonItem(style:UIBarButtonSystemItem,action:Selector){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: style, target: self, action: action);
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
