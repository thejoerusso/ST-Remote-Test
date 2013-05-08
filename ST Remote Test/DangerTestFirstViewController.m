//
//  DangerTestFirstViewController.m
//  ST Remote Test
//
//  Created by Joseph Russo on 2/8/13.
//  Copyright (c) 2013 Joseph Russo. All rights reserved.
//

#import "DangerTestFirstViewController.h"
#import "MHRotaryKnob.h"

@interface DangerTestFirstViewController ()

@end

@implementation DangerTestFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    //-----------------------------//
    //KNOB SETUP-------------------//
    //-----------------------------//
    self.volumeKnob.interactionStyle = MHRotaryKnobInteractionStyleSliderVertical;
    self.volumeKnob.maximumValue = 24;
    self.volumeKnob.minimumValue = 0;
	self.volumeKnob.scalingFactor = 2.5f;
	self.volumeKnob.defaultValue = self.volumeKnob.value;
	self.volumeKnob.resetsToDefault = YES;
	self.volumeKnob.backgroundColor = [UIColor clearColor];
	[self.volumeKnob setKnobImage:[UIImage imageNamed:@"Knob.png"]
                         forState:UIControlStateNormal];
	[self.volumeKnob setKnobImage:[UIImage imageNamed:@"Knob Highlighted.png"]
                         forState:UIControlStateHighlighted];
	[self.volumeKnob setKnobImage:[UIImage imageNamed:@"Knob Disabled.png"]
                         forState:UIControlStateDisabled];
	self.volumeKnob.knobImageCenter = CGPointMake(80.0f, 76.0f);
	[self.volumeKnob addTarget:self action:@selector(volumeKnobDidChange)
              forControlEvents:UIControlEventValueChanged];
}

- (IBAction)volumeKnobDidChange
{
	NSLog(@"%.0f", self.volumeKnob.value);
}

- (IBAction)inputSelect:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSString *title = button.titleLabel.text.uppercaseString;
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
