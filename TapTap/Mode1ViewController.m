//
//  Mode1ViewController.m
//  TapTap
//
//  Created by Bryan Fu on 4/13/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import "Mode1ViewController.h"

@interface Mode1ViewController ()

@end

@implementation Mode1ViewController{

}

- (IBAction)resetButton:(id)sender {
  timerInt = 10;
  resultCount = 0;
  count = 0;
  [timer invalidate];
  score.text = [NSString stringWithFormat:@"Score: %d", count];
  seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
  resetButton.hidden = YES;
  gameOver.hidden = YES;
  tapButton.hidden = NO;
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
    int currHighScore = [[getHighScore objectForKey:@"mode1HighScore"]integerValue];
    if(resultCount > currHighScore){
      currHighScore = resultCount;
    }
    NSUserDefaults *setHighScore = [NSUserDefaults standardUserDefaults];
    [setHighScore setObject:[NSNumber numberWithInt:currHighScore] forKey:@"mode1HighScore"];
    [setHighScore synchronize];
    resetButton.hidden = NO;
    tapButton.hidden = YES;
  }
}

- (IBAction)tapButton:(id)sender {
  if(count == 0){
    timerInt = 10;
    resultCount = 0;
    seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
  }
  if(timerInt != 0){
    count++;
    score.text = [NSString stringWithFormat:@"Score: %d", count];
  }
}

- (IBAction)returnToHome:(id)sender{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  resetButton.hidden = YES;
  gameOver.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
