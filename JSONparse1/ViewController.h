//
//  ViewController.h
//  JSONparse1
//
//  Created by Rahul Morade on 17/05/14.
//  Copyright (c) 2014 Rahul Morade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate , NSURLConnectionDataDelegate
, NSURLConnectionDelegate>
{
    NSMutableData * databuffer;
}

@property (weak, nonatomic) IBOutlet UITextField *txtfd;

- (IBAction)btnclicked:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *temp;

@property (weak, nonatomic) IBOutlet UILabel *wind;

@property (weak, nonatomic) IBOutlet UILabel *sunrise;

@property (weak, nonatomic) IBOutlet UILabel *sunset;

@end
