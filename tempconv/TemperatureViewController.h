//
//  TemperatureViewController.h
//  tempconv
//
//  Created by Y.CORP.YAHOO.COM\ankit13 on 7/24/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\ankit13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *farenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celsiusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;
@end
