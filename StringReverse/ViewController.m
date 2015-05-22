//
//  ViewController.m
//  StringReverse
//
//  Created by N A on 5/20/15.
//  Copyright (c) 2015 N A. All rights reserved.
//

#import "ViewController.h"
#import "ReverseStringCell.h"

static NSString *cellIdentifier = @"Reverse";

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[ReverseStringCell class] forCellReuseIdentifier:cellIdentifier];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReverseStringCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setReversedText:[NSString stringWithFormat:@"foobar%ld", indexPath.row]];
    return cell;
}

@end
