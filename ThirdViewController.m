//
//  ThirdViewController.m
//  iOShw3
//
//  Created by Radhika Mattoo on 10/18/15.
//  Copyright © 2015 nyu.edu. All rights reserved.
//
#import "AppDelegate.h"
#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UILabel *revealCard;
@property (weak, nonatomic) IBOutlet UILabel *dissapointed;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Get Hint";
    
    [self.button setTitle:@"Click to Reveal Card!" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated{
    //make sure secret card isn't showing when you switch views
    [self.button setTitle:@"Click to Reveal Card!" forState:UIControlStateNormal];
    _revealCard.text = @"";
    _dissapointed.text = @"";
}
- (IBAction)revealCard:(UIButton *)sender {
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    //send alert asking if user wants to reveal card
    
    //display card string in button
    [self.button setTitle:@"" forState:UIControlStateNormal];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Are you Sure?!"
                                                                   message:@"Are you absolutely sure you want to reveal the secret card?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction
                         actionWithTitle:@"Yes, now show me the card!"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             _revealCard.text = myDelegate.secretCard;
                             _dissapointed.text = @"Well, that was lame.";
                             
                         }];
    UIAlertAction* no = [UIAlertAction
                             actionWithTitle:@"Fiiiiine, I won't!"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                [self.button setTitle:@"Click to Reveal Card!" forState:UIControlStateNormal];
                                 
                             }];
    
    [alert addAction:yes];
    [alert addAction:no];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)alertView:(UIAlertController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) { // Set buttonIndex == 0 to handel "Ok"/"Yes" button response
        // Cancel button response
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
