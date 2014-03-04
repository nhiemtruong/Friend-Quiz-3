//
//  QuestionPack.m
//  Friend Quiz
//
//  Created by Shi Yo Jou on 2014/2/12.
//  Copyright (c) 2014年 Christian Retureta. All rights reserved.
//

#import "QuestionPack.h"

@implementation QuestionPack

@synthesize questionPackID, questionTitle, questionIndex, questionAnswers, questionSuggestedAnswers, questionCorrectAnswerIndex;


static QuestionPack *sharedAwardCenter = nil;    // static instance variable

+ (QuestionPack *)sharedCenter {
    if (sharedAwardCenter == nil) {
        sharedAwardCenter = [[super allocWithZone:NULL] init];
    }
    return sharedAwardCenter;
}

- (id)init {
    if ( (self = [super init]) ) {
        // your custom initialization
    }
    return self;
}

- (void)customMethod {
    // implement your custom code here
}



-(void)enterQuestionPackIDandGetInfoFromDatabase: (int)packID
{
    questionPackID = packID;
    
    //Database code
    
    //testing code
    questionTitle = [NSMutableArray arrayWithObjects:
                     @"How old am I?",
                     @"What color do I like?",
                     @"What's my favorite food?",
                     @"What's my favorite drink?",
                     @"Where do I live?",nil];
    
    questionSuggestedAnswers = [[NSMutableArray alloc] initWithCapacity: 5];
    
    [questionSuggestedAnswers insertObject:[NSMutableArray arrayWithObjects:
                                            @"10",@"20",@"30",@"40",nil] atIndex:0];
    [questionSuggestedAnswers insertObject:[NSMutableArray arrayWithObjects:
                                            @"Black",@"White",@"Blue",@"Red",nil] atIndex:1];
    [questionSuggestedAnswers insertObject:[NSMutableArray arrayWithObjects:
                                            @"Cake",@"Ice cream",@"candy",@"insects",nil] atIndex:2];
    [questionSuggestedAnswers insertObject:[NSMutableArray arrayWithObjects:
                                            @"7up",@"Coke",@"Sprit",@"Vodka",nil] atIndex:3];
    [questionSuggestedAnswers insertObject:[NSMutableArray arrayWithObjects:
                                            @"Vancouver",@"Raincover",@"Snowcover",@"Earth",nil] atIndex:4];
  
    

}

@end
