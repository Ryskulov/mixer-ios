//
//  APIInteractor.h
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemJsonModel.h"

typedef void (^successBlock)(NSArray <ItemJsonModel *> *result);
typedef void (^errorBlock)(NSError *error);


@interface APIInteractor : NSObject
- (void) getTestItemsWithCompletion:(successBlock)successB
							  error:(errorBlock)errorB;
@end
