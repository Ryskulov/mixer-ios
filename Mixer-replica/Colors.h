//
//  Colors.h
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Colors : NSObject
+ (UIColor *) colorRed:(NSInteger) red green:(NSInteger) green blue:(NSInteger) blue;

+ (UIColor *) colorRed:(NSInteger) red green:(NSInteger) green blue:(NSInteger) blue alpha:(CGFloat) alpha;

+ (UIColor *) commonGrayBackGround;

+ (UIColor *) yellowFavoriteColor;

@end
