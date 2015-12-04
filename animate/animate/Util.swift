//
//  Util.swift
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.width;
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height;

func SwiftClassFromString(className:String) -> AnyClass?{
    
    if let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String{
        let classStringName = "_TtC\(appName.utf16.count)\(appName)\(className.utf8.count)\(className)"
        return NSClassFromString(classStringName);
    }
    
    return nil;
    
}