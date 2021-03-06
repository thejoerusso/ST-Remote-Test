//
//  DangerTestFirstViewController.h
//  ST Remote Test
//
//  Created by Joseph Russo on 2/8/13.
//  Copyright (c) 2013 Joseph Russo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHRotaryKnob;

@interface DangerTestFirstViewController : UIViewController{
    
    /*IBOutlet and IBAction are purely there as markers that Interface Builder
     looks for when itparses your code at design time, they don't have any 
     affect on the code generated by the compiler.*/
    
    IBOutlet UIButton   *mainButton;
    IBOutlet UIButton   *alt1Button;
    IBOutlet UIButton   *alt2Button;
    IBOutlet UIButton   *subButton;
    IBOutlet UIButton   *lowPassButton;
    IBOutlet UIButton   *an1Button;
    IBOutlet UIButton   *an2Button;
    IBOutlet UIButton   *an3Button;
    IBOutlet UIButton   *an4Button;
    IBOutlet UIButton   *auxButton;
    IBOutlet UIButton   *talkButton;
    IBOutlet UIButton   *dimButton;
    IBOutlet UIButton   *soloButton;
    IBOutlet UIButton   *leftButton;
    IBOutlet UIButton   *right1Button;
    
}

@property (nonatomic, weak) IBOutlet MHRotaryKnob *volumeKnob;

- (IBAction)volumeKnobDidChange;

@end
