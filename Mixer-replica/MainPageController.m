//
//  MainPageController.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "MainPageController.h"
#import "MainPageCollectionViewCell.h"
#import "APIInteractor.h"
#import "FavoriteManager.h"

static NSString * const mainCellReuseID = @"MainPageCellReuseID";

@interface MainPageController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MainCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray <ItemJsonModel *> *items;
@property (strong, nonatomic) FavoriteManager *favManager;
@property (assign, nonatomic) NSInteger currentPage;

@end

@implementation MainPageController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.favManager = [FavoriteManager new];
    self.currentPage = 1;
    
	self.items = [NSMutableArray array];
    self.collectionView.backgroundColor = [Colors commonGrayBackGround];
    [self getitems];
}


- (void) getitems {
    [[APIInteractor new]
     getItemsForMainPageWithParamsPage:self.currentPage
     completion:^(NSArray *result) {
         [self.items addObjectsFromArray:result];
         [self.collectionView reloadData];
     }
     error:^(NSError *error) {
         
     }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    if (indexPath.item + 1 == self.items.count) {
        self.currentPage ++ ;
        [self getitems];
    }
    
    
	MainPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellReuseID forIndexPath:indexPath];
	
    ItemJsonModel *item = [self.items objectAtIndex:indexPath.item];
    cell.item = item;
    cell.isFavorite = [self.favManager isItemFavorite:item];
    cell.delegate = self;
	[cell setupCell];
		
	return cell;
}

#pragma mark - CollectionViewLayout

    //Размер ячейки
- (CGSize) collectionView:(UICollectionView *) collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize sizeOfCell = CGSizeZero;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width / 2 - 0.5);
//    CGFloat width = ([UIScreen mainScreen].bounds.size.width / 2) - 4; если хотим сделать расстояние между ячейками.

    sizeOfCell = CGSizeMake(width, 310);
    return sizeOfCell;
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}


#pragma mark - MainCellDelegate

-(void)addToFavorite:(ItemJsonModel *)item {
    
    [self.favManager saveToFavorite:item];
    
}

-(void)deleteFromFavorite:(ItemJsonModel *)item {
    
    [self.favManager removeFromFavorute:item];
    
}
@end
