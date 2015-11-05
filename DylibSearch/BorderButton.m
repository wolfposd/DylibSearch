//
//  BorderButton.m
//  DylibSearch
//
//  Created by wolf on 05.11.15.
//  Copyright © 2015 posdorfer. All rights reserved.
//

#import "BorderButton.h"

@implementation BorderButton

+(id) buttonWithColors:(UIColor*) textColor
{
    id bt =  [BorderButton buttonWithType:UIButtonTypeCustom];
    [bt titleLabel].textColor = textColor;
    return bt;
}


- (void)drawRect:(CGRect)rect
{
    self.layer.borderWidth = 1;
    self.layer.borderColor = self.titleLabel.textColor.CGColor; //[UIColor blueColor].CGColor;
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
}
@end
