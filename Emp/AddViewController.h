//
//  AddViewController.h
//  Emp
//
//  Created by optimusmac-12 on 22/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <sqlite3.h>

@interface AddViewController : UIViewController

@property (nonatomic,strong) NSString *databasePath;
@property (nonatomic) sqlite3 *DB;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *designation;
@property (weak, nonatomic) IBOutlet UITextField *empCode;
@property (weak, nonatomic) IBOutlet UITextField *photo;
@property (weak, nonatomic) IBOutlet UITextField *tagLine;
@property (weak, nonatomic) IBOutlet UITextField *department;

- (IBAction)insertButton:(id)sender;
@end
