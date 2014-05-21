//
//  Mode3ViewController.m
//  TapTap
//
//  Created by Bryan Fu on 4/17/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import "Mode3ViewController.h"

@interface Mode3ViewController ()

@end

@implementation Mode3ViewController

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
  tapButton.hidden = YES;
  gameOver.hidden = YES;
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

- (IBAction)returnToHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startButton:(id)sender {
  if(count == 0){
    timerInt = 20;
    resultCount = 0;
    seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    startStatus.hidden = YES;
    tapButton.hidden = NO;
  }
}

- (IBAction)tapButton:(id)sender {
  const int lowerX = 27;
  const int upperX = 496;
  const int lowerY = 55;
  const int upperY = 210;

  if(timerInt != 0){
    count++;
    score.text = [NSString stringWithFormat:@"Score: %d", count];

    CGRect btFrame = tapButton.frame;
    btFrame.origin.x = lowerX + rand()%(upperX - lowerX);
    btFrame.origin.y = lowerY + rand()%(upperY - lowerY);
    tapButton.frame = btFrame;
  }
}

- (IBAction)resetButton:(id)sender {
  timerInt = 20;
  resultCount = 0;
  count = 0;
  [timer invalidate];
  score.text = [NSString stringWithFormat:@"Score: %d", count];
  seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
  startStatus.hidden = NO;
  resetButton.hidden = YES;
  gameOver.hidden = YES;
}




- (void) countDown{
  timerInt -= 1;
  seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];

  //when time is up
  if(timerInt <= 0){
    [timer invalidate];
    seconds.text = [NSString stringWithFormat:@"Time Is Up!"];
    resultCount = count;
    score.text = [NSString stringWithFormat:@"Score: %d", resultCount];
    gameOver.hidden = NO;

    //review highscore.
    NSUserDefaults *getHighScore = [NSUserDefaults standardUserDefaults];
    int currHighScore = [[getHighScore objectForKey:@"mode3HighScore"]integerValue];
    if(resultCount > currHighScore){
      currHighScore = resultCount;
    }
    NSUserDefaults *setHighScore = [NSUserDefaults standardUserDefaults];
    [setHighScore setObject:[NSNumber numberWithInt:currHighScore] forKey:@"mode3HighScore"];
    [setHighScore synchronize];

    count = 0;
    resultCount = 0;
    tapButton.hidden = YES;
    resetButton.hidden = NO;
  }
}







@end
