//
//  MainPageCollectionViewCell.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "MainPageCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface MainPageCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *shopLable;

@end

@implementation MainPageCollectionViewCell
- (void) setupCell {
    self.titleLabel.text = self.item.title;   //[self.item objectForKey:@"title"];
    self.priceLable.text = self.item.priceSom;
    self.shopLable.text = self.item.shopName;
//    self.oldPriceLable.text = self.item.
    
    if (self.item.priceSomDiscount.length  > 0) {
        self.priceLable.text = self.item.priceSomDiscount;
        self.oldPriceLable.text = self.item.priceSom;
    } else {
        self.priceLable.text = self.item.priceSom;
    }
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.item.pictureUrl]
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                 if (image) {
                                     self.imageView.image = image;
                                 }
                             }];
}

@end
