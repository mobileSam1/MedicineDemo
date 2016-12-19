//
//  NetworkOperationManager.h
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkOperationManager : NSObject

/* 
 Performs http Get operations 
 */
+ (void)performGetOperationWithBaseUrl:(NSString *)baseUrl
                         andParameters:(NSDictionary *)parameters
                           WithSuccess:(void (^)(NSURLSessionTask *, NSDictionary *))success
                               Failure:(void (^)(NSString *))failure;


/* 
 Performs http Post operations
 */
+ (void)performPostOperationWithBaseUrl:(NSString *)baseUrl
                          andParameters:(NSDictionary *)parameters
                            WithSuccess:(void (^)(NSURLSessionTask *, id))success
                                Failure:(void (^)(NSString *))failure;
@end
