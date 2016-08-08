//
//  JDMWordsModel.m
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import "JDMWordsModel.h"

@implementation JDMWordsModel

#pragma mark - properties
@synthesize words;

-(id) init
{
  if(self = [super init])
  {
      NSURL *urlToFile = [[NSBundle mainBundle] URLForResource:@"Vocabwords" withExtension:@"txt"];
      
      self.words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];
  }
    return self;
}

#pragma mark - Class Methods

-(NSArray *) letters
{

   return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    
    
}

-(NSString *) letterAtIndex: (NSInteger) aLetterIndex
 {
     return [[self letters] objectAtIndex:aLetterIndex];
 }


-(NSString *) wordAtIndex: (NSInteger) aWordIndex
          inLetterAtIndex: (NSInteger) aLetterIndex
{
    NSString *letter = [self letterAtIndex:aLetterIndex];
    NSArray *wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];

}

-(NSArray *) wordsAtIndex: (NSInteger) anIndex
{
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter]  sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

@end

