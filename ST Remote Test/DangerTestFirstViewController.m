//
//  DangerTestFirstViewController.m
//  ST Remote Test
//
//  Created by Joseph Russo on 2/8/13.
//  Copyright (c) 2013 Joseph Russo. All rights reserved.
//

#import "DangerTestFirstViewController.h"

@interface DangerTestFirstViewController ()

@end

@implementation DangerTestFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)inputSelect:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSString *title = button.titleLabel.text.uppercaseString;//how to write this without dot notation?
    
    //is this a sloppy way of doing XOR buttons?
    [an1Button setSelected:NO];
    [an2Button setSelected:NO];
    [an3Button setSelected:NO];
    [an4Button setSelected:NO];
    
    [sender setSelected:YES];
    
    NSLog(@"SET %@", title);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
