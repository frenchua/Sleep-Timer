//
//  CountdownTimer.h
//  Sleep Timer
//
//  Created by Josh French on 7/16/14.
//  Copyright (c) 2014 Joshua French. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerActions.h"



@interface CountdownTimer : NSObject

@property BOOL isRunning;
@property NSInteger hours;
@property NSInteger minutes;
@property NSInteger seconds;
@property CountdownTimerAction action;

- (id)initWithTimeInHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds action:(CountdownTimerAction)action;


@end
