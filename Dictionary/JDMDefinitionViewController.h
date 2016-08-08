//
//  JDMDefinitionViewController.h
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDMWordsTableViewController;
@class JDMDefinitionViewController;


@interface JDMDefinitionViewController : UIViewController <UIWebViewDelegate,UISplitViewControllerDelegate>

@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *load;
@property (copy,nonatomic) NSString *wordModel;


-(id) initWithModel: (NSString *) aModel;


@end