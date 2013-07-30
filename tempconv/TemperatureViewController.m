//
//  TemperatureViewController.m
//  tempconv
//
//  Created by Y.CORP.YAHOO.COM\ankit13 on 7/24/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\ankit13. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
- (void) onDoneButton;
- (void) updateConversions;
- (float) getTempInCelsius;
- (float) getTempInFarenheit;
@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.farenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onDoneButton {
    [self.view endEditing:YES];
    [self updateConversions];
}

#pragma mark - UITextField delegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    [self updateConversions];
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateConversions];
    return YES;
}


#pragma mark - Private Methods
- (float) getTempInCelsius {
    float tempCelsius = [self.celsiusTextField.text floatValue];
    return tempCelsius;
}

- (float) getTempInFarenheit {
    float tempFarenheit = [self.farenheitTextField.text floatValue];
    return tempFarenheit;
}
- (void) updateConversions {
    float tempC = [self.celsiusTextField.text floatValue];
    float tempF = [self.farenheitTextField.text floatValue];
    

    if (tempC == 0 && tempF == 0) {
        //dont need to update anything.
        //user hasnt typed anything
    } else if (tempC == 0 && tempF != 0) {
        float tempinC = (tempF - 32)*0.55;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", tempinC];
    } else if (tempC != 0 && tempF == 0) {
        float tempinF = (tempC * (1.8))+32;
        self.farenheitTextField.text = [NSString stringWithFormat:@"%0.2f", tempinF];
    }

}


@end
