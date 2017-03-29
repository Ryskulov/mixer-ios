//
//  APIInteractor.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "APIInteractor.h"
#import "AFNetworking.h"


static NSString * const server = @"http://mixer.kg/";

@interface APIInteractor ()

@property (strong, nonatomic) AFHTTPSessionManager* manager;

@end

@implementation APIInteractor

- (instancetype)init {
	self = [super init];
	
	if (self) {
		self.manager = [AFHTTPSessionManager manager];
	}
	return self;
}

- (void) getTestItemsWithCompletion:(successBlock)successB
							  error:(errorBlock)errorB {
	
	
    NSDictionary *params = @{@"page":@"3"};
    
	[self.manager GET:[NSString stringWithFormat:@"%@api/products", server]
		   parameters:params
			 progress:^(NSProgress * _Nonnull downloadProgress) {
					
			 }
			  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSError *jsonError = nil;
                  NSArray *responseArray = [ItemJsonModel arrayOfModelsFromDictionaries:responseObject error:&jsonError];
                  
                  
				  successB(responseArray);
			 
              }
			  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
				 
			 }];
	
}


- (void) getItemsForMainPageWithParamsPage:(NSInteger) page
                                completion:(successBlock) successB
                                     error:(errorBlock) errorB {
    
    NSString *pageNum = [NSString stringWithFormat:@"%ld", page];
    NSDictionary *params = @{@"page":pageNum};
    
    [self.manager GET:[NSString stringWithFormat:@"%@api/products", server]
           parameters:params
             progress:^(NSProgress * _Nonnull downloadProgress) {
                 
             }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSError *jsonError = nil;
                  NSArray *responseArray = [ItemJsonModel arrayOfModelsFromDictionaries:responseObject error:&jsonError];
                  
                  
                  successB(responseArray);
                  
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
              }];
    
}

@end
