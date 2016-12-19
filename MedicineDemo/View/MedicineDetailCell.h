//
//  medicineDetailCell.h
//  MedicineDemo
//
//  Created by Soumitra Joshi on 19/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MedicineDetailCell : UITableViewCell
- (void)updateCellWithData:(NSManagedObject *)medicine;
@end
