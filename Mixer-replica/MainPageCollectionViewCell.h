//
//  MainPageCollectionViewCell.h
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemJsonModel.h"


@protocol MainCellDelegate <NSObject>

@required
- (void) addToFavorite:(ItemJsonModel *)item;
- (void) deleteFromFavorite:(ItemJsonModel *)item;
@end


@interface MainPageCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) ItemJsonModel *item;
@property (assign, nonatomic) BOOL isFavorite;

@property (weak, nonatomic) id<MainCellDelegate> delegate;

- (void) setupCell;
@end
