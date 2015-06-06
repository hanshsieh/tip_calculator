//
//  ViewController.m
//  Tipd
//
//  Created by Chu-An Hsieh on 6/3/15.
//  Copyright (c) 2015 Chu-An Hsieh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self displayTheKeyboard];
}

- (void)displayTheKeyboard {
    [self.billAmount becomeFirstResponder];
}

- (void)dismissTheKeyboard {
    [self.billAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender {
    NSLog(@"tip percent changed: %ld",
          (long)sender.selectedSegmentIndex);
    [self dismissTheKeyboard];
}
@end
