//
//  AppDelegate.h
//  iOShw3
//
//  Created by Radhika Mattoo on 10/18/15.
//  Copyright © 2015 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *secretCard;
@property (strong, nonatomic) NSString *oldCard;//for second VC, to make sure we don't double count a guess (if moving from Third VC -> Second VC)
@property (strong, nonatomic) NSString *pickerValue;
@property int numGuesses;


@end

