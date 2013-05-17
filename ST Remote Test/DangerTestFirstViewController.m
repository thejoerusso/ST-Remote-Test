//
//  DangerTestFirstViewController.m
//  ST Remote Test
//
//  Created by Joseph Russo on 2/8/13.
//  Copyright (c) 2013 Joseph Russo. All rights reserved.
//

#import "DangerTestFirstViewController.h"
#import "MHRotaryKnob.h"
#import "GCDAsyncUdpSocket.h"

@interface DangerTestFirstViewController ()

@end

@implementation DangerTestFirstViewController

//GLOBAL VARS---------------------//
GCDAsyncUdpSocket *udpSocket ;
int vol = 0;
int newVol = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //-----------------------------//
    //UDP SETUP_-------------------//
    //-----------------------------//
    udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    NSData *data = [[NSString stringWithFormat:@"Hello World"]
                             dataUsingEncoding:NSUTF8StringEncoding];
    
    [udpSocket sendData:data toHost:@"192.168.2.250" port:6000 withTimeout:-1 tag:1];//Test send
    
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

- (IBAction)volumeKnobDidChange{
    newVol = (int)roundf(self.volumeKnob.value);//round to an int
    if (newVol != vol) {
        vol = newVol;
        NSString *string = [NSString stringWithFormat:@"%d", vol];//convert to string
        NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];//convert to NSData
        [udpSocket sendData:data toHost:@"192.168.2.250" port:6000 withTimeout:-1 tag:1];
        NSLog(@"VOL: %d", vol);
    }
   
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
    
    NSData* data = [title dataUsingEncoding:NSUTF8StringEncoding];
    [udpSocket sendData:data toHost:@"192.168.2.250" port:6000 withTimeout:-1 tag:1];
}

- (IBAction)outPutSelect:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSString *title = button.titleLabel.text.uppercaseString;
    [mainButton setSelected:NO];
    [alt1Button setSelected:NO];
    [alt2Button setSelected:NO];
    [subButton setSelected:NO];
    [sender setSelected:YES];
    NSLog(@"SET %@", title);
    
    NSData* data = [title dataUsingEncoding:NSUTF8StringEncoding];
    [udpSocket sendData:data toHost:@"192.168.2.250" port:6000 withTimeout:-1 tag:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
