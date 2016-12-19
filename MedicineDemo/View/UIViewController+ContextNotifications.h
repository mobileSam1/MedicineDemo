//
//  UIViewController+ContextNotifications.h
//  MedicineDemo
//
//  Created by Soumitra Joshi on 18/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (ContextNotifications)
- (void)showMessage:(NSString *)message;

- (void)showMessage:(NSString *)message atOffset:(float)yOffset;

- (void)showActivityIndicator:(NSString *)message;

- (void)showActivityIndicator:(NSString *)message animated:(BOOL)animated;

- (void)showActivityIndicator;

- (void)hideActivityIndicator;
@end
