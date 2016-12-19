//
//  NetworkOperationManager.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "NetworkOperationManager.h"
#import <AFNetworking/AFHTTPSessionManager.h>


@implementation NetworkOperationManager

+ (void)performGetOperationWithBaseUrl:(NSString *)baseUrl
                         andParameters:(NSDictionary *)parameters
                           WithSuccess:(void (^)(NSURLSessionTask *, NSDictionary *))success
                               Failure:(void (^)(NSString *))failure
{
    NSURL *URL = [NSURL URLWithString:baseUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager GET:URL.absoluteString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject)
    {
        NSLog(@"responseObject: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]])
            success (task, responseObject);
        else
            failure(@"There is some problem please try again later");
    }
    failure:^(NSURLSessionTask *operation, NSError *error)
    {
         NSLog(@"Error: %@", error);
         failure(error.localizedDescription);
    }];
}

+ (void)performPostOperationWithBaseUrl:(NSString *)baseUrl
                         andParameters:(NSDictionary *)parameters
                           WithSuccess:(void (^)(NSURLSessionTask *, id))success
                               Failure:(void (^)(NSString *))failure
{
    NSURL *URL = [NSURL URLWithString:baseUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager POST:URL.absoluteString parameters:parameters progress:nil success:^(NSURLSessionDataTask * task, id responseObject)
    {
        NSLog(@"responseObject: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]])
            success (task, responseObject);
        else
            failure(@"There is some problem please try again later");
    }
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"Error: %@", error);
        failure(error.localizedDescription);
    }];
}

@end
