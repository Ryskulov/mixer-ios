//
//  FavoriteManager.h
//  Mixer-replica
//
//  Created by Chingiz Ryskulov on 03.04.17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemJsonModel.h"


@interface FavoriteManager : NSObject
- (NSMutableArray *) getFavoriteItems;

- (void) saveToFavorite:(ItemJsonModel *)item;
- (void) removeFromFavorute:(ItemJsonModel *)item;
- (BOOL) isItemFavorite:(ItemJsonModel *)item;
@end
