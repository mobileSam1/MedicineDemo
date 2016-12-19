//
//  ViewController.m
//  MedicineDemo
//
//  Created by Soumitra Joshi on 17/12/16.
//  Copyright © 2016 Soumitra Joshi. All rights reserved.
//

#import "ViewController.h"
#import "Webservices.h"
#import "UIViewController+ContextNotifications.h"
#import "ChemicalList.h"
#import <CoreData/CoreData.h>
#import "MedicineDetailCell.h"
#import "Constants.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *medicineList;
}
@property (weak, nonatomic) IBOutlet UIButton *btnRetry;
@property (weak, nonatomic) IBOutlet UITableView *medicineTable;
@end

@implementation ViewController

#pragma mark - View methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"HEALTH CART";
    self.medicineTable.hidden = YES;
    [self setupRetryButton];
    [self fetchMedicineList];
}


#pragma mark - Helpers
/*
 Setup retry button
 */
- (void)setupRetryButton
{
    self.btnRetry.layer.cornerRadius = 8.0f;
    self.btnRetry.layer.borderWidth = 1.0f;
    self.btnRetry.layer.borderColor = [UIColor colorWithRed:(64/255.0f) green:(147/255.0f) blue:(125/255.0f) alpha:1.0f].CGColor;
    [self.btnRetry setTitle:@"Retry fetching" forState:UIControlStateNormal];
    [self.btnRetry setTitle:@"Retry fetching" forState:UIControlStateHighlighted];
    self.btnRetry.layer.masksToBounds = YES;
    self.btnRetry.hidden = YES;
}

/*
 Requests for medicine list
 */
- (void)fetchMedicineList
{
    [self showActivityIndicator];
    [Webservices requestChemicalListWithSuccess:^
    {
        [self hideActivityIndicator];
        [self getStoreListOrshowError:nil];
    }
    Failure:^(NSString *error)
    {
        [self hideActivityIndicator];
        [self getStoreListOrshowError:error];
    }];
}

/*
 Fetches medicine list from store and displays in table
 */
- (void)getStoreListOrshowError:(NSString *)error
{
    ChemicalList *model = [[ChemicalList alloc] init];
    NSArray *storeList = [model getChemicalListFromStore];
    if (storeList)
    {
        medicineList = storeList;
        [self.medicineTable reloadData];
        self.medicineTable.hidden = NO;
    }
    else if (error != nil)
    {
        [self showMessage:error atOffset:40];
        self.btnRetry.hidden = NO;
    }
    else
    {
        [self showMessage:@"There is some error please try again" atOffset:40];
        self.btnRetry.hidden = NO;
    }
}

/*
 Retry button action
 */
- (IBAction)retryAction:(id)sender
{
    [self getStoreListOrshowError:nil];
}

#pragma mark - TableView methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [medicineList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MedicineDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell updateCellWithData:(NSManagedObject *)[medicineList objectAtIndex:indexPath.section]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 7.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 7.0f)];
    footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
@end
