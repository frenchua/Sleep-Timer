//
//  AppDelegate.h
//  Sleep Timer
//
//  Created by Josh French on 7/16/14.
//  Copyright (c) 2014 Joshua French. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CountdownTimer.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

// Outlets to MainMenu.xib
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *hourText;
@property (weak) IBOutlet NSStepper *hourStepper;
@property (weak) IBOutlet NSTextField *minuteText;
@property (weak) IBOutlet NSStepper *minuteStepper;
@property (weak) IBOutlet NSTextField *secondText;
@property (weak) IBOutlet NSStepper *secondStepper;
@property (weak) IBOutlet NSPopUpButton *actionSelector;
@property (weak) IBOutlet NSButton *startAndStopButton;

// Countdown Timer (model in MVC pattern).
@property CountdownTimer *timer;


// Actions From MainMenu.xib:
// Called When Timer Action popup button is changed.
- (IBAction)updateTimerAction:(id)sender;
// Called when start/stop button is pushed
- (IBAction)startOrStopTimer:(id)sender;
// called when hr/min/sec steppers are pressed
- (IBAction)updateHourTime:(id)sender;
- (IBAction)updateMinuteTime:(id)sender;
- (IBAction)updateSecondTime:(id)sender;


// Updates the MainMenu.xib (view) to match the model.
- (void)updateUserInterface;

// Called by NSTextField classes in MainMenu.xib are changed.
// Handles field input validation and updating model.
- (void)controlTextDidChange:(NSNotification *)obj;


@end
