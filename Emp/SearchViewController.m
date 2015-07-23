//
//  SearchViewController.m
//  Emp
//
//  Created by optimusmac-12 on 23/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "SearchViewController.h"
#import <sqlite3.h>
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchButton:(id)sender
{
    
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if(sqlite3_open(dbpath, &_DB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM emp WHERE name = \"%@\"", _name.text];
        const char *query_statement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_DB, query_statement, -1, &statement, NULL) == SQLITE_OK)
        {
            if(sqlite3_step(statement) == SQLITE_ROW)
            {
                _nameLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
               
                _designationLabel.text= [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                 _empCodeLabel.text= [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
              
                _photoLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                
                _tagLineLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
             
                _departmentLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                
                
                [self showUIAlertWithMessage:@"Match found in database" andTitle:@"Message"];
                _nameLabel.hidden=false;
                _designationLabel.hidden=false;
                _empCodeLabel.hidden=false;
                _photoLabel.hidden=false;
                _tagLineLabel.hidden=false;
                _departmentLabel.hidden=false;
                _n.hidden=false;
                
            }
            else
            {
                [self showUIAlertWithMessage:@"Match not found in databse" andTitle:@"Message"];
                
            }
            sqlite3_finalize(statement);
        }
        else
        {
            [self showUIAlertWithMessage:@"Failed to search the database" andTitle:@"Error"];
        }
        sqlite3_close(_DB);
        
    }

}
-(void) showUIAlertWithMessage:(NSString*)message andTitle:(NSString*)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end
