//
//  HighScoreViewController.m
//  TapTap
//
//  Created by Bryan Fu on 4/17/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import "HighScoreViewController.h"

@interface HighScoreViewController ()

@end

@implementation HighScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *getHighScore1 = [NSUserDefaults standardUserDefaults];
    int HighScore1 = [[getHighScore1 objectForKey:@"mode1HighScore"]integerValue];
    mode1HS.text = [NSString stringWithFormat:@"%d", HighScore1];
    NSUserDefaults *getHighScore2 = [NSUserDefaults standardUserDefaults];
    int HighScore2 = [[getHighScore2 objectForKey:@"mode2HighScore"]integerValue];
    mode2HS.text = [NSString stringWithFormat:@"%d", HighScore2];
    NSUserDefaults *getHighScore3 = [NSUserDefaults standardUserDefaults];
    int HighScore3 = [[getHighScore3 objectForKey:@"mode3HighScore"]integerValue];
    mode3HS.text = [NSString stringWithFormat:@"%d", HighScore3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)homeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)resetHighScore:(id)sender {
  int zero = 0;
  NSUserDefaults *setHighScore1 = [NSUserDefaults standardUserDefaults];
  [setHighScore1 setObject:[NSNumber numberWithInt:zero] forKey:@"mode1HighScore"];
  [setHighScore1 synchronize];
  NSUserDefaults *setHighScore2 = [NSUserDefaults standardUserDefaults];
  [setHighScore2 setObject:[NSNumber numberWithInt:zero] forKey:@"mode2HighScore"];
  [setHighScore2 synchronize];
  NSUserDefaults *setHighScore3 = [NSUserDefaults standardUserDefaults];
  [setHighScore3 setObject:[NSNumber numberWithInt:zero] forKey:@"mode3HighScore"];
  [setHighScore3 synchronize];

  mode1HS.text = [NSString stringWithFormat:@"%d", zero];
  mode2HS.text = [NSString stringWithFormat:@"%d", zero];
  mode3HS.text = [NSString stringWithFormat:@"%d", zero];
}


@end
