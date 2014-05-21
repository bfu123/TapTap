//
//  HighScoreViewController.h
//  TapTap
//
//  Created by Bryan Fu on 4/17/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoreViewController : UIViewController{
  IBOutlet UILabel *mode1HS;
  IBOutlet UILabel *mode2HS;
  IBOutlet UILabel *mode3HS;
}
- (IBAction)homeButton:(id)sender;
- (IBAction)resetHighScore:(id)sender;

@end
