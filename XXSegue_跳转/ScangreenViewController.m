//
//  ScangreenViewController.m
//  ScanProject
//
//  Created by 徐征 on 2017/11/9.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import "ScangreenViewController.h"

@interface ScangreenViewController ()

@end

@implementation ScangreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self performSegueWithIdentifier:@"rootSegu" sender:nil];
        
        
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
