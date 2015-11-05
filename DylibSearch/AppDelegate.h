//
//  AppDelegate.h
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sysout.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end



@interface SysoutToStd :NSObject <SysoutObserver>
@end