//
//  TipViewController.m
//  Tipd
//
//  Created by Chu-An Hsieh on 6/7/15.
//  Copyright (c) 2015 Chu-An Hsieh. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onAmountDataUpdated:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString*) nibNameOrNil bundle:(NSBundle*) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tib Controller";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onAmountDataUpdated:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)onSettingsButton {
    SettingsViewController* settings = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settings animated:YES];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.10), @(0.15), @(0.20)];
    size_t tipIdx = self.tipControl.selectedSegmentIndex;
    float tipAmount = [tipValues[tipIdx] floatValue] * billAmount;
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id percentageIdx = [defaults objectForKey:@"default_percentage_idx"];
    if (percentageIdx == nil) {
        percentageIdx = @0;
    }
    self.tipControl.selectedSegmentIndex = [percentageIdx integerValue];
    [self updateValues];
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