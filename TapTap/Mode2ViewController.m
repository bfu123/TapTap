//
//  Mode2ViewController.m
//  TapTap
//
//  Created by Bryan Fu on 4/13/14.
//  Copyright (c) 2014 bfu123. All rights reserved.
//

#import "Mode2ViewController.h"
#include <stdlib.h>

@interface Mode2ViewController ()

@end

@implementation Mode2ViewController

- (IBAction)startButton:(id)sender {
  if(count == 0){
    timerInt = 15;
    resultCount = 0;
    seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    [leftStatus setTitle:@"         " forState: UIControlStateNormal];
    [rightStatus setTitle:@"         " forState: UIControlStateNormal];
    leftActive = false;
    rightActive = false;
    startStatus.hidden = YES;
    if(random()%2){
      leftActive = true;
      [leftStatus setTitle:@"LEFT" forState: UIControlStateNormal];
      leftStatus.hidden = NO;
      rightStatus.hidden = NO;
    }else{
      rightActive = true;
      [rightStatus setTitle:@"RIGHT" forState: UIControlStateNormal];
      leftStatus.hidden = NO;
      rightStatus.hidden = NO;

    }
  }
}

- (IBAction)returnToHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//left tapping button
- (IBAction)leftTap:(id)sender {
  if(timerInt != 0){
    //when user clicked when "LEFT" appears
    if(leftActive){
      leftActive = false;
      count++;
      score.text = [NSString stringWithFormat:@"Score: %d", count];
      [leftStatus setTitle:@"         " forState: UIControlStateNormal];
      [rightStatus setTitle:@"         " forState: UIControlStateNormal];
      if(random()%2){
        leftActive = true;
        [leftStatus setTitle:@"LEFT" forState: UIControlStateNormal];
      }else{
        rightActive = true;
        [rightStatus setTitle:@"RIGHT" forState: UIControlStateNormal];
      }
    }
    //when wrong button is clicked
    else if (timerInt >= 1){
      if(count >= 1){
        score.text = [NSString stringWithFormat:@"Score: %d", --count];
      }
    }
  }
}
//right tapping button
- (IBAction)rightTap:(id)sender {
  if(timerInt != 0){
    if(rightActive){
      rightActive = false;
      count++;
      score.text = [NSString stringWithFormat:@"Score: %d", count];
      [leftStatus setTitle:@"         " forState: UIControlStateNormal];
      [rightStatus setTitle:@"         " forState: UIControlStateNormal];
      if(random()%2){
        leftActive = true;
        [leftStatus setTitle:@"LEFT" forState: UIControlStateNormal];
      }else{
        rightActive = true;
        [rightStatus setTitle:@"RIGHT" forState: UIControlStateNormal];
      }
    }
    //when wrong button is clicked
    else if(timerInt >= 1){
      if(count >= 1){
        score.text = [NSString stringWithFormat:@"Score: %d", --count];
      }
    }
  }
}

- (IBAction)resetButton:(id)sender {
  timerInt = 15;
  resultCount = 0;
  count = 0;
  [timer invalidate];
  score.text = [NSString stringWithFormat:@"Score: %d", count];
  seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];

  [leftStatus setTitle:@"         " forState: UIControlStateNormal];
  [rightStatus setTitle:@"         " forState: UIControlStateNormal];
  startStatus.hidden = NO;
  resetButton.hidden = YES;
  gameOver.hidden = YES;
}

- (void) countDown{
  timerInt -= 1;
  seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
  if(timerInt <= 0){
    [timer invalidate];
    seconds.text = [NSString stringWithFormat:@"Time Is Up!"];
    resultCount = count;
    seconds.text = [NSString stringWithFormat:@"Time Left: %d", timerInt];
    score.text = [NSString stringWithFormat:@"Score: %d", resultCount];
    gameOver.hidden = NO;

    //review highscore.
    NSUserDefaults *getHighScore = [NSUserDefaults standardUserDefaults];
    int currHighScore = [[getHighScore objectForKey:@"mode2HighScore"]integerValue];
    if(resultCount > currHighScore){
      currHighScore = resultCount;
    }
    NSUserDefaults *setHighScore = [NSUserDefaults standardUserDefaults];
    [setHighScore setObject:[NSNumber numberWithInt:currHighScore] forKey:@"mode2HighScore"];
    [setHighScore synchronize];

    leftStatus.hidden = YES;
    rightStatus.hidden = YES;
    resetButton.hidden = NO;
    count = 0;
    resultCount = 0;
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  leftStatus.hidden = YES;
  rightStatus.hidden = YES;
  resetButton.hidden = YES;
  gameOver.hidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
