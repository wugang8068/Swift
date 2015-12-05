//
//  ViewController.swift
//  CCAnimation
//
//  Created by CatStandInTheCorner on 15/12/5.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var animationView: CCAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.animationView.textFont = UIFont.systemFontOfSize(42);
    }

    @IBAction func startAnimation(sender: UIButton) {
        self.animationView.value = 43003484210;
        //self.animationView.value = NSNumber(int: rand() % 500);
        self.animationView.density = 30;
        self.animationView.duration = 4;
        self.animationView.durationOffset = 0.3;
        self.animationView.startAnimation();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

