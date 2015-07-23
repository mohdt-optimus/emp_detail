//
//  AddViewController.m
//  Emp
//
//  Created by optimusmac-12 on 22/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "AddViewController.h"
#import <sqlite3.h>

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    //Get the directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    //Build the path to keep the database
    _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Emp.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if([filemgr fileExistsAtPath:_databasePath] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        
        if(sqlite3_open(dbpath, &_DB) == SQLITE_OK){
            char *errorMessage;
            const char *sql_statement = "CREATE TABLE IF NOT EXISTS emp (name text,designation text,empCode integer PRIMARY KEY,photo text,tagLine text,department text)";
            
            if(sqlite3_exec(_DB, sql_statement, NULL, NULL, &errorMessage) != SQLITE_OK){
                [self showUIAlertWithMessage:@"Failed to create the table" andTitle:@"Error"];
            }
            sqlite3_close(_DB);
        }
        else{
            [self showUIAlertWithMessage:@"Failed to open/create the table" andTitle:@"Error"];
        }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)insertButton:(id)sender
{
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if(sqlite3_open(dbpath, &_DB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO emp (name,designation,empCode,photo,tagLine,department) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", _name.text, _designation.text, _empCode, _photo.text,_tagLine.text,_department.text];
        
        const char *insert_statement = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DB, insert_statement, -1, &statement, NULL);
        
        if(sqlite3_step(statement) == SQLITE_DONE){
            [self showUIAlertWithMessage:@"User added to the database" andTitle:@"Message"];
            _name.text = @"";
            _designation.text = @"";
            _empCode = 0;
            _photo.text=@"";
            _tagLine.text=@"";
            _department.text=@"";
            
            
        }
        else{
            [self showUIAlertWithMessage:@"Failed to add the user" andTitle:@"Error"];
        }
        sqlite3_finalize(statement);
        sqlite3_close(_DB);
    }

    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
/*
 NSString *docsDir;
 NSArray *dirPaths;
 
 //Get the directory
 dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 docsDir = dirPaths[0];
 
 //Build the path to keep the database
 _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"myUsers.db"]];
 
 NSFileManager *filemgr = [NSFileManager defaultManager];
 
 if([filemgr fileExistsAtPath:_databasePath] == NO){
 const char *dbpath = [_databasePath UTF8String];
 
 if(sqlite3_open(dbpath, &_DB) == SQLITE_OK){
 char *errorMessage;
 const char *sql_statement = "CREATE TABLE IF NOT EXISTS users (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
 
 if(sqlite3_exec(_DB, sql_statement, NULL, NULL, &errorMessage) != SQLITE_OK){
 [self showUIAlertWithMessage:@"Failed to create the table" andTitle:@"Error"];
 }
 sqlite3_close(_DB);
 }
 else{
 [self showUIAlertWithMessage:@"Failed to open/create the table" andTitle:@"Error"];
 }
 }
 }
 

*/