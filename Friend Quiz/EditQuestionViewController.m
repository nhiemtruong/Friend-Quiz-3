//
//  EditQuestionViewController.m
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/12.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import "EditQuestionViewController.h"

@interface EditQuestionViewController ()

@end

@implementation EditQuestionViewController

@synthesize selectedQuestionPackID,correctAnswerIndex,
questionTitleLabel, question1label, question2label, question3label, question4label;

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
    
    correctAnswerIndex = -1;
    
    
    // Get question pack information from database
    [[QuestionPack sharedCenter]enterQuestionPackIDandGetInfoFromDatabase:selectedQuestionPackID];
    
    // Get question detail
    questionTitleLabel.text = [QuestionPack sharedCenter].questionTitle[[QuestionPack sharedCenter].questionIndex] ;
    
     [question1label setTitle:[[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][0]forState:UIControlStateNormal  ];
    
    [question2label setTitle:[[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][1]forState:UIControlStateNormal  ];
    
    [question3label setTitle:[[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][2]forState:UIControlStateNormal  ];
    
    [question4label setTitle:[[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][3]forState:UIControlStateNormal  ];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)question1button:(id)sender {
    
    correctAnswerIndex = 0;
    
    question1label.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(150/255.0) blue:(0/255.0) alpha:1];
    
    question2label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question3label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question4label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    
}

- (IBAction)question2button:(id)sender {
    
    correctAnswerIndex = 1;
    
    question2label.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(150/255.0) blue:(0/255.0) alpha:1];
    
    question1label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question3label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question4label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
}

- (IBAction)question3button:(id)sender {
    
    correctAnswerIndex = 2;
    
    question3label.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(150/255.0) blue:(0/255.0) alpha:1];
    
    question1label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question2label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question4label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
}

- (IBAction)question4button:(id)sender {
    
    correctAnswerIndex = 3;
    
    question4label.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(150/255.0) blue:(0/255.0) alpha:1];
    
    question1label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question2label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
    question3label.backgroundColor = [UIColor colorWithRed:(251/255.0) green:(255/255.0) blue:(13/255.0) alpha:1];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // Canceled
    }
    else
    {
        
        // Update the new answer
        
        if (alertView.tag == 0)
        {
        NSString *stringInput =[alertView textFieldAtIndex:0].text;
        [question1label setTitle:[NSString stringWithFormat:@"%@", stringInput ] forState: UIControlStateNormal];
        [[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][0] = stringInput;
        }
        else if (alertView.tag == 1)
        {
            NSString *stringInput =[alertView textFieldAtIndex:0].text;
            [question2label setTitle:[NSString stringWithFormat:@"%@", stringInput ] forState: UIControlStateNormal];
            [[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][1] = stringInput;
        }
        else if (alertView.tag == 2)
        {
            NSString *stringInput =[alertView textFieldAtIndex:0].text;
            [question3label setTitle:[NSString stringWithFormat:@"%@", stringInput ] forState: UIControlStateNormal];
            [[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][2] = stringInput;
        }
        else if (alertView.tag == 3)
        {
            NSString *stringInput =[alertView textFieldAtIndex:0].text;
            [question4label setTitle:[NSString stringWithFormat:@"%@", stringInput ] forState: UIControlStateNormal];
            [[QuestionPack sharedCenter].questionSuggestedAnswers objectAtIndex:[QuestionPack sharedCenter].questionIndex][3] = stringInput;
        }
        
    }
}


- (IBAction)q1EditButton:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Edit Question Answer" message:@"Question 1 Answer:" delegate:self cancelButtonTitle:@"Cancel"  otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert setTag:0];
    [alert show];
    
}

- (IBAction)q2EditButton:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Edit Question Answer" message:@"Question 2 Answer:" delegate:self cancelButtonTitle:@"Cancel"  otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert setTag:1];
    [alert show];
    
}

- (IBAction)q3EditButton:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Edit Question Answer" message:@"Question 3 Answer:" delegate:self cancelButtonTitle:@"Cancel"  otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert setTag:2];
    [alert show];
    
}

- (IBAction)q4EditButton:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Edit Question Answer" message:@"Question 4 Answer:" delegate:self cancelButtonTitle:@"Cancel"  otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert setTag:3];
    [alert show];
    
}




- (IBAction)buttonNext:(id)sender {
    
    if (correctAnswerIndex == -1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Choose the correct answer" message:@"Press the correct answer to select it!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
    else
    {
        
        
        
        // Send the correct answer index
        [[QuestionPack sharedCenter].questionCorrectAnswerIndex setObject: [NSString stringWithFormat: @"%d", correctAnswerIndex] atIndexedSubscript:[QuestionPack sharedCenter].questionIndex];
        
        // Send correct answers
        if (![QuestionPack sharedCenter].questionAnswers)
        {
            [QuestionPack sharedCenter].questionAnswers = [[NSMutableArray alloc] initWithCapacity: 5];
        }
    
        [[QuestionPack sharedCenter].questionAnswers insertObject:[NSMutableArray arrayWithObjects:
                                           question1label.titleLabel.text,
                                           question2label.titleLabel.text,
                                           question3label.titleLabel.text,
                                           question4label.titleLabel.text, nil] atIndex: [QuestionPack sharedCenter].questionIndex];
        
        
        // Index +1
        [QuestionPack sharedCenter].questionIndex++;
    
        // Exit Condition
        if([QuestionPack sharedCenter].questionIndex == 5)
        {
            [self performSegueWithIdentifier:@"toSendRequest" sender:nil];
        }
        else
        {
            [self performSegueWithIdentifier:@"toSelf" sender:nil];
        }
    
    }
}
@end
