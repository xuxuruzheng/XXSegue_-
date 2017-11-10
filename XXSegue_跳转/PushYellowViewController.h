//
//  PushYellowViewController.h
//  ScanProject
//
//  Created by 徐征 on 2017/11/9.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^yellowBlock)(NSString *string);

@interface PushYellowViewController : UIViewController

@property (nonatomic, copy) NSString *stringY;

@property (nonatomic, copy) yellowBlock block;

@end
