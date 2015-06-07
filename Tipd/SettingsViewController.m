//
//  SettingsViewController.m
//  Tipd
//
//  Created by Chu-An Hsieh on 6/7/15.
//  Copyright (c) 2015 Chu-An Hsieh. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercentControl;
- (IBAction)onDefaultPercentChange:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id percentageIdx = [defaults objectForKey:@"default_percentage_idx"];
    if (percentageIdx == nil) {
        percentageIdx = @0;
    }
    self.defaultPercentControl.selectedSegmentIndex = [percentageIdx integerValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDefaultPercentChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    size_t percentageIdx = [self.defaultPercentControl selectedSegmentIndex];
    [defaults setInteger:percentageIdx forKey:@"default_percentage_idx"];
    [defaults synchronize];
}
@end


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */