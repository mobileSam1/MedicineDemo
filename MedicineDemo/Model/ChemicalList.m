//
//  Chemical.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "ChemicalList.h"
#import "Constants.h"

@implementation ChemicalList
- (void)parseAndStoreListWithDict:(NSDictionary *)dict
{
    id chemicalList = [dict valueForKey:@"result"];
    if (chemicalList && [chemicalList isKindOfClass:[NSArray class]])
    {
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Chemical" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
        
        for (NSDictionary *chemicalDict in chemicalList)
        {
            NSManagedObject *chemicalObj = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:APP_DELEGATE.managedObjectContext];

            id chemicalId = [chemicalDict valueForKey:@"id"];
            if (chemicalId && [chemicalId isKindOfClass:[NSString class]])
            {
                [chemicalObj setValue:chemicalId forKey:@"id"];
            }
            else
                [chemicalObj setValue:@"000" forKey:@"id"];
            
            id name = [chemicalDict valueForKey:@"name"];
            if (name && [name isKindOfClass:[NSString class]])
            {
                [chemicalObj setValue:name forKey:@"name"];
            }
            else
                [chemicalObj setValue:@"b" forKey:@"name"];
            
            id type = [chemicalDict valueForKey:@"type"];
            if (type && [type isKindOfClass:[NSString class]])
            {
                [chemicalObj setValue:type forKey:@"type"];
            }
            else
                [chemicalObj setValue:@"generics" forKey:@"type"];
            
            id manufacturer = [chemicalDict valueForKey:@"manufacturer"];
            if (manufacturer && [manufacturer isKindOfClass:[NSString class]])
            {
                [chemicalObj setValue:manufacturer forKey:@"manufacturer"];
            }
            else
                [chemicalObj setValue:@"Unkown" forKey:@"manufacturer"];
            
            NSError *error = nil;
            if (![chemicalObj.managedObjectContext save:&error]) {
                NSLog(@"Unable to save managed object context.");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
        }
    }
}

- (NSArray *)getChemicalListFromStore
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Chemical" inManagedObjectContext:APP_DELEGATE.managedObjectContext];

    NSError *error = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    NSArray *result = [APP_DELEGATE.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error)
    {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    else
    {
        NSLog(@"%@", result);
        if ([result count])
            return result;
    }
    return nil;
}

@end
