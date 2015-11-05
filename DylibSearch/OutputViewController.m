//
//  OutputViewController.m
//  DylibSearch
//
//  Created by wolf on 05.11.15.
//  Copyright © 2015 posdorfer. All rights reserved.
//

#import "OutputViewController.h"
#import "AppScanner.h"

@interface OutputViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textview;

@end

@implementation OutputViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.textview.text = @"";
    [[Sysout sharedManager] addObserver:self];
    
    
    [AppScanner startScanning];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[Sysout sharedManager] removeObserver:self];
}


-(void)print:(NSString *)stringToPrint
{
    self.textview.text = [NSString stringWithFormat:@"%@\n%@",self.textview.text, stringToPrint];
}


@end
