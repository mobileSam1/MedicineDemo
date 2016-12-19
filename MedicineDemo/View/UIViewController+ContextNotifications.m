//
//  UIViewController+ContextNotifications.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 18/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "UIViewController+ContextNotifications.h"

@implementation UIViewController (ContextNotifications)
- (void)showMessage:(NSString *)message
{
    if (!message) {
        return;
    }
    
    [self hideAllHUDS];
    
    UIView *containerView = self.navigationController.view ? : self.view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:containerView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    hud.detailsLabelText = message;
    hud.yOffset = containerView.frame.size.height / 2 - 100;
    [hud hide:YES afterDelay:2];
}


- (void)showMessage:(NSString *)message atOffset:(float)yOffset
{
    if (!message) {
        return;
    }
    
    [self hideAllHUDS];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view ? : self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    hud.detailsLabelText = message;
    hud.yOffset = yOffset;
    [hud hide:YES afterDelay:2];
}

- (void)showActivityIndicator:(NSString *)message
{
    [self hideAllHUDS];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view ? : self.view animated:YES];
    hud.yOffset = -50;
    if (message) {
        hud.detailsLabelText = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}

- (void)showActivityIndicator:(NSString *)message animated:(BOOL)animated
{
    [self hideAllHUDS];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view ? : self.view animated:animated];
    hud.yOffset = -50;
    if (message) {
        hud.detailsLabelText = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}
- (void)showActivityIndicator
{
    [MBProgressHUD showHUDAddedTo:self.navigationController.view ? : self.view animated:YES];
}

- (void)hideActivityIndicator
{
    [self hideAllHUDS];
}

- (void)hideAllHUDS
{
    [MBProgressHUD hideAllHUDsForView:self.navigationController.view ? : self.view animated:YES];
}

@end
