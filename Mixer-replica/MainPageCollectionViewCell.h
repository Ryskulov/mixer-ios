//
//  MainPageCollectionViewCell.h
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemJsonModel.h"


@interface MainPageCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) ItemJsonModel *item;

- (void) setupCell;
@end
