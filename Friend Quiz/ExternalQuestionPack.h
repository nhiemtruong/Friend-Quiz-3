//
//  ExternalQuestionPack.h
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/26.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExternalQuestionPack : NSObject

// Pack ID
@property int questionPackID;
@property NSString *sender;
@property NSString *receiver;

// Questions
@property NSMutableArray *questionTitle;
@property NSMutableArray *questionAnswers;
@property NSMutableArray *questionCorrectAnswerIndex;




@end
