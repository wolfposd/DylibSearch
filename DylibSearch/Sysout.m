//
//  Sysout.m
//  DylibSearch
//
//  Created by wolf on 05.11.15.
//  Copyright © 2015 posdorfer. All rights reserved.
//

#import "Sysout.h"


@interface Sysout ()

@property (nonatomic,retain) NSMutableArray* observers;

@end


@implementation Sysout


-(instancetype) init
{
    self = [super init];
    if(self)
    {
        _observers = [NSMutableArray new];
    }
    return self;
}


+(Sysout*) sharedManager
{
    static Sysout *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void) addObserver:(id<SysoutObserver>) observer
{
    [self.observers addObject:observer];
}

-(void) removeObserver:(id<SysoutObserver>) observer
{
    [self.observers removeObject:observer];
}

-(void) println:(NSString*) stringToPrint
{
    for(id<SysoutObserver> ob in self.observers)
    {
        [ob print:stringToPrint];
    }
}

+(void) println:(NSString*) stringToPrint
{
    [[self sharedManager] println:stringToPrint];
}



@end
