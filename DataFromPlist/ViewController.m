//
//  ViewController.m
//  DataFromPlist
//
//  Created by YOUNGSIC KIM on 2017-08-21.
//  Copyright © 2017 YOUNGSIC KIM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray *subjectList;
    NSMutableArray *contentList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    subjectList = [[NSMutableArray alloc]init];
    contentList = [[NSMutableArray alloc]init];
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TestPlist" ofType:@"plist"]];
    NSArray *arrayList = [NSArray arrayWithArray:[dictRoot objectForKey:@"Data"]];
    [arrayList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
             [subjectList addObject:[obj valueForKey:@"Title"]];
             [contentList addObject:[obj valueForKey:@"Content"]];
        }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [subjectList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [subjectList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [contentList objectAtIndex:indexPath.row];
    
    return cell;
    
}
@end
