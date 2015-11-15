//
//  SecondViewController.m
//  iOShw3
//
//  Created by Radhika Mattoo on 10/18/15.
//  Copyright © 2015 nyu.edu. All rights reserved.
//
#import "AppDelegate.h"
#import "SecondViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *checkCard;
@property (weak, nonatomic) IBOutlet UILabel *giveGuesses;
@property (assign, nonatomic) SystemSoundID winSoundID;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Check It";

    
}
-(void) viewDidAppear:(BOOL)animated{
    //get secret card via appDelegate
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    
    //check if it's the same as picker card
    if([myDelegate.secretCard isEqualToString: myDelegate.pickerValue]){
        //yay!!! win! play sound and shit
        
        [self playWinSound];
    }
    else{
        _checkCard.text = myDelegate.pickerValue;
        if(myDelegate.oldCard != myDelegate.pickerValue || myDelegate.numGuesses == 0){
            myDelegate.numGuesses++;
            
            //set the old card to not double count a guess
            myDelegate.oldCard = myDelegate.pickerValue;
        }
        
        _giveGuesses.text = [NSString stringWithFormat:@"%d",myDelegate.numGuesses];
        
    }
    
    //increment numGuesses
    
}
-(void)playWinSound
{
    if (_winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win"
                                                  withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                         &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
    _checkCard.text = @"WINNING!";
    _giveGuesses.text = @"";
    
    [self performSelector:@selector(exit)
               withObject:[UIApplication sharedApplication]
               afterDelay:1.5];
}

-(void)exit{
    [[UIApplication sharedApplication]terminateWithSuccess];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
