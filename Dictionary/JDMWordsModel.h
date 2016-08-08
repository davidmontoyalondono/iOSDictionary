//
//  JDMWordsModel.h
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDMWordsModel : NSObject

@property (strong) NSDictionary *words;

  

-(NSArray *) letters;
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex;
-(NSString *) wordAtIndex: (NSInteger) aWordIndex
          inLetterAtIndex: (NSInteger) aLetterIndex;
-(NSArray *) wordsAtIndex: (NSInteger) anIndex;

@end
