//
//  medicineDetailCell.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 19/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "MedicineDetailCell.h"
@interface MedicineDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblManufacturer;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@end

@implementation MedicineDetailCell
- (void)updateCellWithData:(NSManagedObject *)medicine
{
    self.lblName.text =  [[medicine valueForKey:@"name"] capitalizedString];
    self.lblType.text =  [NSString stringWithFormat:@"Type: %@",[[medicine valueForKey:@"type"] capitalizedString]];
    self.lblManufacturer.text = [NSString stringWithFormat:@"Mfd : %@",[[medicine valueForKey:@"manufacturer"] capitalizedString]];
}

- (void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 6.0;
    self.layer.masksToBounds = YES;
}
@end
