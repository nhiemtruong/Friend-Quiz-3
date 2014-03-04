//
//  EditQuestionViewController.h
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/12.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QuestionPack.h"

@interface EditQuestionViewController : UIViewController

@property int selectedQuestionPackID;

@property int correctAnswerIndex;


@property (weak, nonatomic) IBOutlet UILabel *questionTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *question1label;
@property (weak, nonatomic) IBOutlet UIButton *question2label;
@property (weak, nonatomic) IBOutlet UIButton *question3label;
@property (weak, nonatomic) IBOutlet UIButton *question4label;


- (IBAction)question1button:(id)sender;
- (IBAction)question2button:(id)sender;
- (IBAction)question3button:(id)sender;
- (IBAction)question4button:(id)sender;

- (IBAction)q1EditButton:(id)sender;
- (IBAction)q2EditButton:(id)sender;
- (IBAction)q3EditButton:(id)sender;
- (IBAction)q4EditButton:(id)sender;



- (IBAction)buttonNext:(id)sender;

@end
