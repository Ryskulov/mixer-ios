//
//  MainPageCollectionViewCell.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "MainPageCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RoundedView.h"


@interface MainPageCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *shopLable;
@property (weak, nonatomic) IBOutlet RoundedView *shopNameBackView;

@end


@implementation MainPageCollectionViewCell
- (void) setupCell {
    self.titleLabel.text = self.item.title;   //[self.item objectForKey:@"title"];
    self.priceLable.text = self.item.priceSom;
    self.shopLable.text = self.item.shopName;
    self.shopNameBackView.backgroundColor = [Colors commonGrayBackGround];
    self.shopNameBackView.borderRadius = 8;

//    self.oldPriceLable.text = self.item.
    NSString *mystr = [NSString stringWithFormat:@"%@ сом",self.item.priceSom];
    if (self.item.priceSomDiscount.length  > 0) {
        self.oldPriceLable.hidden =NO;
        self.priceLable.text = self.item.priceSomDiscount;
        
        NSDictionary* attributes = @{
                                     NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                     };
        NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:mystr attributes:attributes];
        self.oldPriceLable.attributedText = attrText;
        
    } else {
        self.oldPriceLable.hidden = YES;
        self.priceLable.text = mystr;
    }
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.item.pictureUrl]
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                 if (image) {
                                     self.imageView.image = image;
                                 }
                             }];
}



-(void)prepareForReuse {
    [super prepareForReuse];
    self.imageView.image = nil;
    self.titleLabel.text = @"";
    self.priceLable.text = nil;
    self.oldPriceLable.text = @"";
    self.shopLable.text = @"";
}
@end
