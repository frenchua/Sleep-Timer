//
//  TimerActions.m
//  Sleep Timer
//
//  Created by Josh French on 12/22/14.
//  Copyright (c) 2014 Josh French. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TimerActions.h"

void JDFExecuteAppleScript(NSString *script) {
    NSAppleScript *scriptObj = [[NSAppleScript alloc] initWithSource:script];
    NSDictionary *unused;
    [scriptObj executeAndReturnError:&unused];
}

void JDFSleep() {
    JDFExecuteAppleScript(@"tell application \"System Events\" to sleep");
}

void JDFShutdown() {
    JDFExecuteAppleScript(@"tell application \"System Events\" to shut down");
}

void JDFRestart() {
    JDFExecuteAppleScript(@"tell application \"System Events\" to restart");
}

void JDFMute() {
    JDFExecuteAppleScript(@"set volume with output muted");
}


