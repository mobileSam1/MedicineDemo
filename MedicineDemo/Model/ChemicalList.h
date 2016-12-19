//
//  Chemical.h
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChemicalList : NSObject
/*
 Parses response data and store chemical objects to database
 */
- (void)parseAndStoreListWithDict:(NSDictionary *)dict;

/*
 Retrieve chemical objects from database
 */
- (NSArray *)getChemicalListFromStore;
@end