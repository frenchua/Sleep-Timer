//
//  AppDelegate.m
//  Sleep Timer
//
//  Created by Josh French on 7/16/14.
//  Copyright (c) 2014 Joshua French. All rights reserved.
//

#import "AppDelegate.h"
#import "TimerActions.h"

@interface AppDelegate ()

// Update model every time Nstimer fires (every second).
- (void)tick:(NSTimer *)timer;

// perform action when timer runs to zero.
- (void)performTimerAction;

// NSTimre set to send the tick: message
// every second.
@property NSTimer *ticker;

@end

@implementation AppDelegate

// App init code. Create new timer, update view
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.timer = [[CountdownTimer alloc] initWithTimeInHours:0 minutes:0 seconds:0 action:CountdownTimerActionSleep];
    [self updateUserInterface];
}


// MainMenu.xib actions:
- (IBAction)updateTimerAction:(id)sender {
    self.timer.action = [sender indexOfSelectedItem];
    [self updateUserInterface];
}

- (IBAction)startOrStopTimer:(id)sender {
    if(self.timer.isRunning) {
        [self.ticker invalidate];
        self.timer.isRunning = NO;
    } else {
        self.ticker = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        self.timer.isRunning = YES;
    }
    [self updateUserInterface];
}

- (IBAction)updateHourTime:(id)sender {
    self.timer.hours = [sender integerValue];
    [self updateUserInterface];
}

- (IBAction)updateMinuteTime:(id)sender {
    self.timer.minutes = [sender integerValue];
    [self updateUserInterface];
}

- (IBAction)updateSecondTime:(id)sender {
    self.timer.seconds = [sender integerValue];
    [self updateUserInterface];
}

// Update the view:
- (void)updateUserInterface {
    self.hourText.integerValue = self.timer.hours;
    self.hourStepper.integerValue = self.timer.hours;
    self.minuteText.integerValue = self.timer.minutes;
    self.minuteStepper.integerValue = self.timer.minutes;
    self.secondText.integerValue = self.timer.seconds;
    self.secondStepper.integerValue = self.timer.seconds;
    [self.actionSelector selectItemAtIndex:self.timer.action];
    if(self.timer.isRunning) {
        self.startAndStopButton.title = @"Stop";
    } else {
        self.startAndStopButton.title = @"Start";
    }
}

// Called by NSTextField objects in MainMenu.xib:
- (void)controlTextDidChange:(NSNotification *)obj {
    // Validate that the input is correct for the NSTextFields
    //     Hour text must be integer between 0 and 99
    //     minute and second text must be integer between 0 and 59
    // To make sure that the user is not allowed to enter
    NSTextField *textField = [obj object];
    NSString *stringValue = [textField stringValue];
    NSInteger integerValue = [stringValue integerValue];
    
    if([stringValue rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound) {
        // field is an integer. Make sure it is a proper value
        
        if(textField == self.hourText) {
            if(integerValue >= 0 && integerValue <= 99) {
                self.timer.hours = integerValue;
            } else {
                [self updateUserInterface];
            }
        } else if(textField == self.minuteText) {
            if(integerValue >= 0 && integerValue < 60) {
                self.timer.minutes = integerValue;
            } else {
                [self updateUserInterface];
            }
        } else if(textField == self.secondText) {
            if(integerValue >= 0 && integerValue < 60) {
                self.timer.seconds = integerValue;
            } else {
                [self updateUserInterface];
            }
        } else {
            // This should never occour... for debugging purposes only...
            NSLog(@"AppDelegate recieved controlTextDidChange: message from unknown sender. This should not happen.");
        }
        
    } else {
        // field is not an integer, update field to what model is.
        [self updateUserInterface];
    }
    // Update UI to model.
    // calling this method will remove leading zeros (eg. "039" becomes "39")
    // it also changes empty fields to model value.
    [self updateUserInterface];
}

// Private methods to update model every second and perform actions:

- (void)tick:(NSTimer *)timer {
    if(self.timer.seconds > 0) {
        self.timer.seconds--;
    } else if(self.timer.minutes > 0) {
        self.timer.seconds = 59;
        self.timer.minutes--;
    } else if(self.timer.hours > 0) {
        self.timer.seconds = 59;
        self.timer.minutes = 59;
        self.timer.hours--;
    } else {
        [self.ticker invalidate];
        self.timer.isRunning = NO;
        [self updateUserInterface];
        [self performTimerAction];
    }
    [self updateUserInterface];
}

- (void)performTimerAction {
    switch(self.timer.action) {
        case CountdownTimerActionSleep:
            JDFSleep();
            break;
        case CountdownTimerActionShutdown:
            JDFShutdown();
            break;
        case CountdownTimerActionRestart:
            JDFRestart();
            break;
        case CountdownTimerActionMute:
            JDFMute();
            break;
    }
}


@end