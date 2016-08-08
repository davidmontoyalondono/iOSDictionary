//
//  JDMWordsTableViewController.h
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDMWordsModel.h"

@class JDMWordsTableViewController;
@class JDMWordsModel;

@protocol WordsTableViewControllerDelegate <NSObject>

-(void) wordsTableViewController: (JDMWordsTableViewController *) sender didClickOnWord: (NSString *) aWord;

@end

@interface JDMWordsTableViewController : UITableViewController

@property (strong,nonatomic) JDMWordsModel *model;
@property (weak) id delegate;

-(id) initWithModel: (JDMWordsModel *) aModel;


@end
