//
//  AnswerQuestionViewController.m
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/26.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import "AnswerQuestionViewController.h"

@interface AnswerQuestionViewController ()

@end

@implementation AnswerQuestionViewController

@synthesize selectedExternalQuestionPack, question1label, question2label, question3label, question4label, questionTitleLabel, selectedQuestionIndex;

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
    
    //test code
    ExternalQuestionPack *data = [[ExternalQuestionPack alloc]init];
    
    [data setQuestionPackID:[QuestionPack sharedCenter].questionPackID ];
    
    [data setQuestionTitle:[QuestionPack sharedCenter].questionTitle ];
    
    [data setQuestionAnswers:[QuestionPack sharedCenter].questionAnswers];
    
    [data setQuestionCorrectAnswerIndex:[QuestionPack sharedCenter].questionCorrectAnswerIndex];
    // test code end
    
    selectedExternalQuestionPack = data;
    
    // Get question detail
    
    questionTitleLabel.text = selectedExternalQuestionPack.questionTitle[[QuestionPack sharedCenter].questionIndex] ;
    
    [question1label setTitle:[selectedExternalQuestionPack.questionAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][0]forState:UIControlStateNormal  ];
    
    [question2label setTitle:[selectedExternalQuestionPack.questionAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][1]forState:UIControlStateNormal  ];
    
    [question3label setTitle:[selectedExternalQuestionPack.questionAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][2]forState:UIControlStateNormal  ];
    
    [question4label setTitle:[selectedExternalQuestionPack.questionAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][3]forState:UIControlStateNormal  ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)checkIfAnswerIsCorrect
{
    NSString *correctAnswerIndex = selectedExternalQuestionPack.questionCorrectAnswerIndex[[QuestionPack sharedCenter].questionIndex];
    if([correctAnswerIndex integerValue] == selectedQuestionIndex)
    {
        // Answer Correct
        
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Text" message:@"Correct" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert2 show];
    }
    else
    {
        // Answer Not Correct
        
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Text" message:@"Incorrect" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert2 show];
    }
}


- (void)exitToNextVCCheck
{
    
    [QuestionPack sharedCenter].questionIndex ++;
    
    // Exit Condition
    if([QuestionPack sharedCenter].questionIndex == 5)
    {
        [self performSegueWithIdentifier:@"toGameResult" sender:nil];
    }
    else
    {
        [self performSegueWithIdentifier:@"toSelf" sender:nil];
    }
    
    
    
}

- (IBAction)question1button:(id)sender
{
    selectedQuestionIndex = 0;
    
    [self checkIfAnswerIsCorrect];
    [self exitToNextVCCheck];
}

- (IBAction)question2button:(id)sender
{
    selectedQuestionIndex = 1;
    
    [self checkIfAnswerIsCorrect];
    [self exitToNextVCCheck];
}

- (IBAction)question3button:(id)sender
{
    selectedQuestionIndex = 2;
    
    [self checkIfAnswerIsCorrect];
    [self exitToNextVCCheck];
}

- (IBAction)question4button:(id)sender
{
    selectedQuestionIndex = 3;
    
    [self checkIfAnswerIsCorrect];
    [self exitToNextVCCheck];
}



@end







