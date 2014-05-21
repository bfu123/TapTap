//
//  Mode2ViewController.h
//  TapTap
//
//  Created by Bryan Fu on 4/13/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mode2ViewController : UIViewController{

  bool leftActive;
  bool rightActive;

  int timerInt;
  int count;
  int resultCount;
  NSTimer *timer;

  IBOutlet UIButton *resetButton;
  IBOutlet UIButton *startStatus;
  IBOutlet UILabel *score;
  IBOutlet UILabel *seconds;
  IBOutlet UIButton *rightStatus;
  IBOutlet UIButton *leftStatus;
  IBOutlet UILabel *gameOver;
}

- (IBAction)startButton:(id)sender;
- (IBAction)returnToHome:(id)sender;
- (IBAction)leftTap:(id)sender;
- (IBAction)rightTap:(id)sender;
- (IBAction)resetButton:(id)sender;


@end
