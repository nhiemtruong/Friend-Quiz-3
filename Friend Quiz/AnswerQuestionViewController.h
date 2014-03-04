//
//  AnswerQuestionViewController.h
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/26.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ExternalQuestionPack.h"
#import "QuestionPack.h"

@interface AnswerQuestionViewController : UIViewController


@property ExternalQuestionPack *selectedExternalQuestionPack;

@property int selectedQuestionIndex;

@property (weak, nonatomic) IBOutlet UILabel *questionTitleLabel;



@property (weak, nonatomic) IBOutlet UIButton *question1label;
@property (weak, nonatomic) IBOutlet UIButton *question2label;
@property (weak, nonatomic) IBOutlet UIButton *question3label;
@property (weak, nonatomic) IBOutlet UIButton *question4label;


- (IBAction)question1button:(id)sender;
- (IBAction)question2button:(id)sender;
- (IBAction)question3button:(id)sender;
- (IBAction)question4button:(id)sender;








@end
