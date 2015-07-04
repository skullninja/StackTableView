//
//  ViewController.m
//  Stack
//
//  Created by Tomoya_Hirano on 5/7/15.
//  Copyright (c) 2015 Tomoya_Hirano. All rights reserved.
//

#import "ViewController.h"
#import "StackTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray*images;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    images = [NSMutableArray new];
    for (int i=0; i<7; i++) {
        NSString*file = [NSString stringWithFormat:@"%d.jpg",i];
        [images addObject:[UIImage imageNamed:file]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate and DataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    StackTableViewCell *cell = [[StackTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([StackTableViewCell class])];
    
    UIImageView*iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    iv.backgroundColor = [UIColor redColor];
    iv.image = images[indexPath.row%7];
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.isLoading = NO; // Fake loading
    });

    [cell.contentView addSubview:iv];
    
    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 0, self.view.bounds.size.width, 44)];
    NSString*text = [NSString stringWithFormat:@"index:%ld",(long)indexPath.row];
    [label setText:text];
    [label setTextColor: [UIColor whiteColor]];
    label.font =[UIFont fontWithName:@"AvenirNextCondensed-Bold" size:25];
    [cell.contentView addSubview: label];

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSLog(@"touch");
}

@end
