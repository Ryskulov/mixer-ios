//
//  ItemJsonModel.h
//  Mixer-replica
//
//  Created by Chingiz Ryskulov on 27.03.17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ItemJsonModel : JSONModel

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *updatedAt;
@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *shopName;
@property (assign, nonatomic) NSInteger itemId;

@property (strong, nonatomic) NSString<Optional> *category;
@property (strong, nonatomic) NSString<Optional> *childCategory;
@property (strong, nonatomic) NSString<Optional> *discount;
@property (strong, nonatomic) NSString<Optional> *fullDescription;
@property (strong, nonatomic) NSString<Optional> *pictureUrl;
@property (strong, nonatomic) NSString<Optional> *priceSom;
@property (strong, nonatomic) NSString<Optional> *priceSomDiscount;
@property (strong, nonatomic) NSString<Optional> *priceUsd;
@property (strong, nonatomic) NSString<Optional> *priceUsdDiscount;
@property (strong, nonatomic) NSString<Optional> *shortDescription;
@property (strong, nonatomic) NSArray <NSString*><Optional> *medias;

@property (assign, nonatomic) BOOL hasDelivery;
@property (assign, nonatomic) BOOL isOffline;
@property (assign, nonatomic) BOOL isEnabled;



@end
