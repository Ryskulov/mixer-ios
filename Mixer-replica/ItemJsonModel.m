//
//  ItemJsonModel.m
//  Mixer-replica
//
//  Created by Chingiz Ryskulov on 27.03.17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "ItemJsonModel.h"

@implementation ItemJsonModel

//+ (JSONKeyMapper *)keyMapper {
//    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
//                                                                  @"title": @"title",
//                                                                  @"category": @"category",
//                                                                  @"childCategory": @"child_category",
//                                                                  @"createdAt": @"created_at",
//                                                                  @"discount": @"discount",
//                                                                  @"fullDescription": @"full_description",
//                                                                  @"pictureUrl": @"picture_url",
//                                                                  @"priceSom": @"price_som",
//                                                                  @"priceDiscount": @"price_discount",
//                                                                  @"priceUsd": @"price_usd",
//                                                                  @"priceUsdDiscount": @"price_usd_discount",
//                                                                  @"shopName": @"shop",
//                                                                  @"shortDescription": @"short_description",
//                                                                  @"updatedAt": @"updated_at",
//                                                                  @"hasDelivery": @"has_delivery",
//                                                                  @"itemId": @"id",
//                                                                  @"isOffline": @"is_offline",
//                                                                  @"isEnabled": @"is_enabled",
//                                                                  @"medias": @"medias",
//
//                                                                  }];
//}

+ (JSONKeyMapper *)keyMapper {
    
    return
    [[JSONKeyMapper alloc]
     initWithModelToJSONDictionary:@{
                                     @"childCategory":@"child_category",
                                     @"category":@"category",
                                     @"createdAt":@"created_at",
                                     @"discount":@"discount",
                                     @"fullDescriptionUrl":@"full_description_url",
                                     @"phone":@"phone",
                                     @"pictureUrl":@"picture_url",
                                     @"priceSom":@"price_som",
                                     @"priceSomDiscount":@"price_som_discount",
                                     @"priceUsd":@"price_usd",
                                     @"priceUsdDiscount":@"price_usd_discount",
                                     @"shopName":@"shop",
                                     @"shortDescription":@"short_description",
                                     @"title":@"title",
                                     @"updatedAt":@"updated_at",
                                     @"medias":@"medias",
                                     @"itemId":@"id",
                                     @"hasDelivery":@"has_delivery",
                                     @"isEnabled":@"is_enabled",
                                     @"isOffline":@"is_offline"
                                     }];
}

@end

