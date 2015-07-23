//
//  ViewController.m
//  Emp
//
//  Created by optimusmac-12 on 22/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"app dir: %@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addDetailsInDb:(id)sender
{
 //   AddViewController *addview=[[AddViewController alloc] init];
 //   [self.navigationController pushViewController:addview animated:YES];
    //[self performSegueWithIdentifier:@"add_segue" sender:self];
    
    
}

@end
