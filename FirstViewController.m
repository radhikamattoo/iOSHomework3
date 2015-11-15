//
//  FirstViewController.m
//  iOShw3
//
//  Created by Radhika Mattoo on 10/18/15.
//  Copyright © 2015 nyu.edu. All rights reserved.
//
#import "AppDelegate.h"
#import "FirstViewController.h"

@interface FirstViewController (){
    NSArray *values;
    NSArray *suit;
    NSArray *images;
    
    NSArray *suitImages;
    
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker;



@end
@implementation FirstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Unlock It";
    
    suitImages = [[NSMutableArray alloc] init];
    
    suitImages = @[[UIImage imageNamed: @"spade"],
                   [UIImage imageNamed: @"hearts"],
                   [UIImage imageNamed: @"club"],
                   [UIImage imageNamed: @"diamonds"]];
    
    
    NSLog(@"array:  %@", suitImages);

//
////    images = @[spade, heart, club, diamond];
//    
//    images = [[NSArray alloc] initWithObjects:spade,heart,club,diamond, nil];

    

}
-(void)viewDidAppear:(BOOL)animated{
    suit = @[@"spades", @"hearts", @"clubs", @"diamonds"];
    values = @[@"Ace of", @"2 of", @"3 of", @"4 of", @"5 of", @"6 of", @"7 of", @"8 of", @"9 of", @"10 of", @"Jack of", @"Queen of", @"King of"];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    //create appdelegate object to access shared data
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    
    //random values for arrays
    int randomSuit = arc4random_uniform([suit count]);
    int randomValue = arc4random_uniform([values count]);
    
    //set secret card variable
    if(!myDelegate.pickerValue){
        myDelegate.oldCard = @"Ace of spades";
        myDelegate.numGuesses = 0;
        myDelegate.secretCard = [NSString stringWithFormat:@"%@ %@", values[randomValue], suit[randomSuit]];
        myDelegate.pickerValue = @"Ace of spades"; //what the picker defaults to anyways
        
        
        //log secret card name for debugging
        NSLog(@"%@", myDelegate.secretCard); 
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}

//number of columns of data
-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //gives the row and component of currently selected picker
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    //so set the app delegate.pickervalue to this
    if(component == 0){
        //get value in other component
        NSInteger suitIndex = [pickerView selectedRowInComponent:1];
        //concatenate and set it to pickerValue
        myDelegate.pickerValue = [NSString stringWithFormat:@"%@ %@", values[row], suit[suitIndex]];
    }
    else{
        NSInteger valueIndex = [pickerView selectedRowInComponent:0];
        //concatenate and set it to pickerValue
        myDelegate.pickerValue = [NSString stringWithFormat:@"%@ %@", values[valueIndex], suit[row]];
    }
}

//number of rows of data
-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //set number of rows
    if(component== 0)
    {
        return [values count];
    }
    else
    {
        return [suit count];
    }
}

//return data in value of specific column in picker
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if(component == 0){//asking for value of card
        return [values objectAtIndex:row];
    }
    else{ //asking for suit 
        return [suit objectAtIndex:row];
    }
      
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    
    if(component == 0){
        UILabel *label = [[UILabel alloc]init];
        label.text = values[row];
        return label;
    }
    else{
        UIImage *image = suitImages[row];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        return imageView;
    }
    
}

@end






