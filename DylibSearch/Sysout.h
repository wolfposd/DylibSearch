//
//  Sysout.h
//  DylibSearch
//
//  Created by wolf on 05.11.15.
//  Copyright © 2015 posdorfer. All rights reserved.
//

#import <Foundation/Foundation.h>




@protocol SysoutObserver <NSObject>

-(void) print:(NSString*) stringToPrint;

@end


@interface Sysout : NSObject


+(Sysout*) sharedManager;

-(void) addObserver:(id<SysoutObserver>) observer;
-(void) removeObserver:(id<SysoutObserver>) observer;


-(void) println:(NSString*) stringToPrint;


+(void) println:(NSString*) stringToPrint;

@end
