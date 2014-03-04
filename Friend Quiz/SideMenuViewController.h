//
//  SideMenuViewController.h
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-02-13.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//@property (strong, nonatomic) IBOutlet UITableViewCell *cell;
//@property (strong, nonatomic) IBOutlet UITableViewCell *otherCell;

//@property (strong, nonatomic) IBOutlet UITableViewCell *cellData;


@end
