//
//  ViewController.m
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import "ViewController.h"
#import "SearchTableViewController.h"
#import "OutputViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (IBAction)startSearchingDylibsTouchUpInside:(id)sender
{
    SearchTableViewController* s = [[SearchTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController pushViewController:s animated:YES];
}

- (IBAction)debugStuffTouchUpInside:(id)sender
{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* s = [sb instantiateViewControllerWithIdentifier:@"OutputViewController"];
    
    [self.navigationController pushViewController:s animated:YES];
}


@end
