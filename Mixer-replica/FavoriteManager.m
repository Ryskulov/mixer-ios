//
//  FavoriteManager.m
//  Mixer-replica
//
//  Created by Chingiz Ryskulov on 03.04.17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "FavoriteManager.h"

@implementation FavoriteManager

- (NSMutableArray *) getFavoriteItems {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"favorites"];
    NSMutableArray *favArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return favArray;
}

- (void) writeFavorites:(NSMutableArray *)favorites {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:favorites];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"favorites"];
    
}


- (void) saveToFavorite:(ItemJsonModel *)item {
    NSMutableArray *favorites = [NSMutableArray arrayWithArray:[self getFavoriteItems]];
    [favorites addObject:item];
    [self writeFavorites:favorites];
}


- (void) removeFromFavorute:(ItemJsonModel *)item {
    
}

- (BOOL) isItemFavorite:(ItemJsonModel *)item {
    NSMutableArray *arr = [self getFavoriteItems];
    for (ItemJsonModel *favItem in arr ) {
        if (favItem.itemId == item.itemId) {
            return YES;
        }
    }
    return NO;
}
@end
