//
//  PackSelectViewController.m
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/12.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import "PackSelectViewController.h"

@interface PackSelectViewController ()

@end

@implementation PackSelectViewController

@synthesize selectedQuestionPackID, arrayQuestionPacks;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableviewQuestionPacks.delegate = self;
    self.tableviewQuestionPacks.dataSource = self;
    
    NSArray *data = [[NSArray alloc]initWithObjects: @"Default Pack", @"Mix Pack", @"Easy Pack", @"Hard Pack", @"Best Friend Pack", @"Fruit Pack", @"Color Pack", @"Location Pack", nil];
    
    
    arrayQuestionPacks = data;
    
    [QuestionPack sharedCenter].questionIndex = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditQuestionViewController *destination = [segue destinationViewController];
    destination.selectedQuestionPackID = selectedQuestionPackID;
}

-(void)selectQuestionPackWithID: (int)packID
{
    [[QuestionPack sharedCenter]enterQuestionPackIDandGetInfoFromDatabase:packID];
}

//Table View Start ---------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayQuestionPacks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [arrayQuestionPacks objectAtIndex: indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:18.0];
    cell.textLabel.textColor = [UIColor colorWithRed:(32/255.0) green:(51/255.0) blue:(202/255.0) alpha:1];
    
    
    UIView *backColor = [[UIView alloc] init] ;
    backColor.backgroundColor = [UIColor colorWithRed:(161/255.0) green:(140/255.0) blue:(255/255.0) alpha:1];
    cell.selectedBackgroundView = backColor;
    
    
    
}
// Table View End ---------


@end
