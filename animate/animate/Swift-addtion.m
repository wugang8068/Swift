//
//  Swift-addtion.m
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

#import "Swift-addtion.h"
#import <UIKit/UIKit.h>




@implementation Swift_addtion

+(id) ControllerFromString:(NSString *)className{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *classStringName = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length, appName, (unsigned long)className.length, className];    
    return [[NSClassFromString(classStringName) alloc] init];
}

@end
