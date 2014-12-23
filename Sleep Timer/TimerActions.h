//
//  TimerActions.h
//  Sleep Timer
//
//  Created by Josh French on 12/22/14.
//  Copyright (c) 2014 Josh French. All rights reserved.
//

#ifndef Sleep_Timer_TimerActions_h
#define Sleep_Timer_TimerActions_h

#import <Foundation/Foundation.h>

// Represents possible actions that the program will do when the timer is up.
typedef NS_ENUM(NSInteger, CountdownTimerAction) {
    CountdownTimerActionSleep,
    CountdownTimerActionShutdown,
    CountdownTimerActionRestart,
    CountdownTimerActionMute
};

// Compile and execute the script given by the argument string
void JDFExecuteAppleScript(NSString *script);

// Put computer to sleep
void JDFSleep();

// shut down computer
void JDFShutdown();

// reboot computer
void JDFRestart();

// Mute System Volume
void JDFMute();

#endif
