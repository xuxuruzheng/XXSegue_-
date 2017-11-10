//
//  ScanStoryboardSegue.m
//  ScanProject
//
//  Created by 惠通互娱Macbook Air on 2017/8/16.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import "ScanStoryboardSegue.h"

@implementation ScanStoryboardSegue



- (void)perform
{
    if ([self.identifier isEqualToString:@"leftSegue"]) {
        
        UIView *rootVcView = ((UINavigationController *)self.sourceViewController).viewControllers[0].view;
//        UIView *rootVcView = self.sourceViewController.view;
        UIView *leftVcView = self.destinationViewController.view;
        
        leftVcView.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window insertSubview:leftVcView aboveSubview:rootVcView];
        
        [UIView animateWithDuration:0.1f animations:^{
            
            leftVcView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 375 * 50, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1f animations:^{
                
                leftVcView.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width / 375 * 10, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.1f animations:^{
                    
                    leftVcView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                    
                }completion:^(BOOL finished) {
                    
                    [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:nil];
                    
                }];
                
            }];
            
        }];
        
    }else if ([self.identifier isEqualToString:@"rootSegue"]) {
        
        UIView *leftVcView = self.sourceViewController.view;
        UIView *rootVcView = self.destinationViewController.view;
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window insertSubview:rootVcView atIndex:window.subviews.count - 1];
        
        [UIView animateWithDuration:0.2f animations:^{
            
            leftVcView.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
        } completion:^(BOOL finished) {
            
            [self.sourceViewController dismissViewControllerAnimated:NO completion:nil];
            
        }];
        
    }
}









@end
