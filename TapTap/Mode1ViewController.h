//
//  Mode1ViewController.h
//  TapTap
//
//  Created by Bryan Fu on 4/13/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mode1ViewController : UIViewController{
  int timerInt;
  int count;
  int resultCount;
  IBOutlet UILabel *seconds;
  IBOutlet UILabel *score;
  NSTimer *timer;
  IBOutlet UIButton *resetButton;
  IBOutlet UILabel *gameOver;
  IBOutlet UIButton *tapButton;
}

- (IBAction)resetButton:(id)sender;
- (IBAction)tapButton:(id)sender;

- (IBAction)returnToHome:(id)sender;



@end
