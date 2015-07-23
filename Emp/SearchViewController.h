//
//  SearchViewController.h
//  Emp
//
//  Created by optimusmac-12 on 23/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface SearchViewController : UIViewController

@property (nonatomic,strong) NSString *databasePath;
@property (nonatomic) sqlite3 *DB;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *designation;
@property (weak, nonatomic) IBOutlet UITextField *empCode;
- (IBAction)searchButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *empCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *n;

@end
