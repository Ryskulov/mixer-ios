//
//  Colors.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "Colors.h"

@implementation Colors
+ (UIColor *) colorRed:(NSInteger) red green:(NSInteger) green blue:(NSInteger) blue {
	
	return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue alpha:1];
	
}

+ (UIColor *) colorRed:(NSInteger) r green:(NSInteger) g blue:(NSInteger) blue alpha:(CGFloat) alpha {
	
	return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:blue alpha:alpha];
	
}
@end
