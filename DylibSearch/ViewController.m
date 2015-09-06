//
//  ViewController.m
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import "ViewController.h"
#import "SearchTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SearchTableViewController* s = [[SearchTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:s]
                       animated:NO completion:^(){}];
}



@end
