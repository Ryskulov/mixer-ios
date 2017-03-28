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


static NSString * const mainCellReuseID = @"MainPageCellReuseID";

@interface MainPageController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray <ItemJsonModel *> *items;
@end

@implementation MainPageController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.items = [NSMutableArray array];
	
	[[APIInteractor new]
	 getTestItemsWithCompletion:^(NSArray *result) {
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
	
	MainPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellReuseID forIndexPath:indexPath];
	
	cell.item = [self.items objectAtIndex:indexPath.item];
	
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
    CGFloat width = ([UIScreen mainScreen].bounds.size.width / 2);
//    CGFloat width = ([UIScreen mainScreen].bounds.size.width / 2) - 4; если хотим сделать расстояние между ячейками.

    sizeOfCell = CGSizeMake(width, width * 2);
    return sizeOfCell;
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


@end
