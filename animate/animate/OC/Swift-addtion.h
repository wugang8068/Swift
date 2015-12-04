//
//  Swift-addtion.h
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface Swift_addtion : NSObject

+(id) ControllerFromString:(NSString *)className;

@end



