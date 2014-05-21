//
//  Mode3ViewController.h
//  TapTap
//
//  Created by Bryan Fu on 4/17/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mode3ViewController : UIViewController{
  int timerInt;
  int count;
  int resultCount;
  IBOutlet UILabel *seconds;
  IBOutlet UILabel *score;
  NSTimer *timer;
  IBOutlet UIButton *startStatus;
  IBOutlet UIButton *tapButton;
  IBOutlet UIButton *resetButton;
  IBOutlet UILabel *gameOver;
}
- (IBAction)returnToHome:(id)sender;
- (IBAction)startButton:(id)sender;
- (IBAction)tapButton:(id)sender;
- (IBAction)resetButton:(id)sender;

@end
