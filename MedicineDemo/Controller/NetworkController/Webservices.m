//
//  Webservices.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "Webservices.h"
#import "NetworkOperationManager.h"
#import "Constants.h"
#import "ChemicalList.h"

@implementation Webservices
+ (void)requestChemicalListWithSuccess:(void (^)())success
                               Failure:(void (^)(NSString *))failure
{
    [NetworkOperationManager performGetOperationWithBaseUrl:MEDICINE_URL andParameters:nil WithSuccess:
    ^(NSURLSessionTask *task, NSDictionary *responseObject)
    {
        ChemicalList *model = [[ChemicalList alloc] init];
        [model parseAndStoreListWithDict:responseObject];
        success();
    }
    Failure:^(NSString *error)
    {
        failure(error);
    }];
}
@end
