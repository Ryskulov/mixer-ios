//
//  RoundedView.m
//  Mixer-replica
//
//  Created by Chingiz Ryskulov on 29.03.17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "RoundedView.h"

@implementation RoundedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    self.borderRadius = self.borderRadius ? self.borderRadius : 5.0;
}

-(CGFloat)borderRadius {
    return self.layer.cornerRadius;
}

-(void)setBorderRadius:(CGFloat)borderRadius {
    self.layer.cornerRadius = borderRadius;
}
@end
