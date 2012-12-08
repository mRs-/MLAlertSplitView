//
//  MLExampleViewController.m
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import "MLExampleViewController.h"
#import "MLAlertSplitView.h"

@interface MLExampleViewController ()

@end

@implementation MLExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertView:(id)sender {
    [[[MLAlertSplitView alloc] initWithTitle:@"Title"
                                     message:@"This fox wants to be knuffig and stupid with you. Is that ok?"
                                    delegate:self
                           cancelButtonTitle:@"Cancel"
                            otherButtonTitle:nil] show];
}
@end
