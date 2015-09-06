//
//  SearchTableViewController.m
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import "SearchTableViewController.h"
#import "FileInfo.h"
#import "FileManager.h"

@interface SearchTableViewController ()

@property (nonatomic,retain) NSArray* listItems;

@end

@implementation SearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Check Dylibs for Strings";
      
    self.listItems = [FileManager findFiles];
    
    [self.tableView reloadData];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"standard"];
    }

    FileInfo* info = self.listItems[indexPath.row];
    
    cell.textLabel.text = info.fileName;

    switch (info.infected) {
        case INFECTED_CHECK_SAFE:
            cell.imageView.image = [UIImage imageNamed:@"ok.png"];
            cell.detailTextLabel.text = info.infectionString;
            break;
        case INFECTED_CHECK_INFECTED:
            cell.imageView.image = [UIImage imageNamed:@"cross.png"];
            cell.detailTextLabel.text = [@"Contains: " stringByAppendingString:info.infectionString];
            break;
        case INFECTED_CHECK_UNKNOWN:
        default:
            cell.imageView.image = [UIImage imageNamed:@"help.png"];
            cell.detailTextLabel.text = info.infectionString;
            break;
    }
    
    
    return cell;
}

@end
