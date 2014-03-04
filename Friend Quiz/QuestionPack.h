//
//  QuestionPack.h
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/12.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionPack : NSObject


+ (QuestionPack *)sharedCenter;   // class method to return the singleton object

- (void)customMethod; // add optional methods to customize the singleton class\

- (void)enterQuestionPackIDandGetInfoFromDatabase: (int)packID;


@property int questionPackID;

@property int questionIndex;


// Questions

@property NSMutableArray *questionTitle;

@property NSMutableArray *questionSuggestedAnswers;
@property NSMutableArray *questionAnswers;

@property NSMutableArray *questionCorrectAnswerIndex;



@end
