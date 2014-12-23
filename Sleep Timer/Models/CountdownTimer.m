//
//  CountdownTimer.m
//  Sleep Timer
//
//  Created by Josh French on 7/16/14.
//  Copyright (c) 2014 Joshua French. All rights reserved.
//

#import "CountdownTimer.h"

@implementation CountdownTimer


- (id)initWithTimeInHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds action:(CountdownTimerAction)action {
    self = [super init];
    if(self) {
        _isRunning = NO;
        _hours = hours;
        _minutes = minutes;
        _seconds = seconds;
        _action = action;
    }
    return self;
}


@end
