//
//  Webservices.h
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Webservices : NSObject
/*
 Method to request list of chemicals
 */
+ (void)requestChemicalListWithSuccess:(void (^)())success
                               Failure:(void (^)(NSString *))failure;
@end
