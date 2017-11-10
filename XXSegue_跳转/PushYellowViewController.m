//
//  PushYellowViewController.m
//  ScanProject
//
//  Created by 徐征 on 2017/11/9.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import "PushYellowViewController.h"

@interface PushYellowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation PushYellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.stringY);
    self.label.text = self.stringY;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.block) {
        self.block(@"yellow回传String");
    }
    [self performSegueWithIdentifier:@"pop" sender:nil];
    
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

@end
