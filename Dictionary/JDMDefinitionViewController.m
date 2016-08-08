//
//  JDMDefinitionViewController.m
//  Dictionary
//
//  Created by user10591 on 1/30/14.
//  Copyright (c) 2014 user10591. All rights reserved.
//

#import "JDMDefinitionViewController.h"
#import "JDMWordsTableViewController.h"

@interface JDMDefinitionViewController ()

@end

@implementation JDMDefinitionViewController

-(id) initWithModel:(NSString *)aModel
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _wordModel = aModel;
        self.title = @"Web";
    }

    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.browser.delegate = self;
    [self.load startAnimating];
    [self.load setHidden:NO];
    [self.browser loadRequest:[self definitionRequestForWord:@"Abdicate"] ];
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - wordsTableViewdelegate

-(void) wordsTableViewController: (JDMWordsTableViewController *) sender didClickOnWord: (NSString *) aWord{
    
    self.wordModel = aWord;
    
    [self.browser loadRequest:[self definitionRequestForWord:aWord] ];
    
    }

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.load stopAnimating];
    [self.load setHidden:YES];
}



#pragma mark - utils

-(NSURLRequest *) definitionRequestForWord:(NSString *) aWord
{

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}

-(void) splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}


@end
