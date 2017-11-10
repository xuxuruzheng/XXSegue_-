//
//  UIView+Constraint.m
//  ScanProject
//
//  Created by 惠通互娱Macbook Air on 2017/8/16.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import "UIView+Constraint.h"
#import <objc/runtime.h>

// width height
#define MAINSCREEN [UIScreen mainScreen].bounds
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height


// 适配宽高(当前用4.7寸屏作适配)
#define ADAPTIVE(f) ((SCREENWIDTH / 375) * (f))


@implementation UIView (Constraint)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class _class = [UIView class];
        
        SEL original = @selector(awakeFromNib);
        SEL new = @selector(newAwakeFromNib);
        
        Method originalMethod = class_getInstanceMethod(_class, original);
        Method newMethod = class_getInstanceMethod(_class, new);
        
        if (class_addMethod(_class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            
            class_replaceMethod(_class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else {
            
            method_exchangeImplementations(originalMethod, newMethod);
        }
    });
    
}

- (void)newAwakeFromNib
{
    [self newAwakeFromNib];
    
//    NSLog(@"newAwakeFromNib");
    
    self.layer.cornerRadius = ADAPTIVE(self.layer.cornerRadius);

    if ([self isKindOfClass:[UILabel class]]) {
        
        UILabel *_self = (UILabel *)self;
        _self.font = [UIFont fontWithName:_self.font.fontName size:[UIView adaptFontSize:_self.font.pointSize]];
//        NSLog(@"Label name: %@ pointSize: %f", _self.text, _self.font.pointSize);
    }else if ([self isKindOfClass:[UIButton class]]) {
        
        UIButton *_self = (UIButton *)self;
//        NSLog(@"button name: %@ pointSize: %f", _self.titleLabel.text, _self.titleLabel.font.pointSize);
        _self.titleLabel.font = [UIFont fontWithName:_self.titleLabel.font.fontName size:[UIView adaptFontSize:_self.titleLabel.font.pointSize]];
        _self.contentEdgeInsets = UIEdgeInsetsMake(ADAPTIVE(_self.contentEdgeInsets.top), ADAPTIVE(_self.contentEdgeInsets.left), ADAPTIVE(_self.contentEdgeInsets.bottom), ADAPTIVE(_self.contentEdgeInsets.right));
        _self.titleEdgeInsets = UIEdgeInsetsMake(ADAPTIVE(_self.titleEdgeInsets.top), ADAPTIVE(_self.titleEdgeInsets.left), ADAPTIVE(_self.titleEdgeInsets.bottom), ADAPTIVE(_self.titleEdgeInsets.right));
        _self.imageEdgeInsets = UIEdgeInsetsMake(ADAPTIVE(_self.imageEdgeInsets.top), ADAPTIVE(_self.imageEdgeInsets.left), ADAPTIVE(_self.imageEdgeInsets.bottom), ADAPTIVE(_self.imageEdgeInsets.right));
    }else if ([self isKindOfClass:[UITextField class]]) {
        
        UITextField *_self = (UITextField *)self;
        _self.font = [UIFont fontWithName:_self.font.fontName size:[UIView adaptFontSize:_self.font.pointSize]];
    }else if ([self isKindOfClass:[UITextView class]]) {
        
        UITextView *_self = (UITextView *)self;
        _self.font = [UIFont fontWithName:_self.font.fontName size:[UIView adaptFontSize:_self.font.pointSize]];
    }else if ([self isKindOfClass:[UITableView class]]) {
        
        UITableView *_self = (UITableView *)self;
//        NSLog(@"UITableView headView: %f", _self.tableFooterView.frame.size.height);
//        NSLog(@"UITableView footerView: %f", _self.tableFooterView.frame.size.height);
        _self.sectionHeaderHeight = ADAPTIVE(_self.sectionHeaderHeight);
        _self.sectionFooterHeight = ADAPTIVE(_self.sectionFooterHeight);
        _self.tableHeaderView.frame = CGRectMake(0, 0, ADAPTIVE(_self.tableHeaderView.frame.size.width), ADAPTIVE(_self.tableHeaderView.frame.size.height));
        _self.tableFooterView.frame = CGRectMake(0, 0, ADAPTIVE(_self.tableFooterView.frame.size.width), ADAPTIVE(_self.tableFooterView.frame.size.height));
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        
        UIScrollView *_self = (UIScrollView *)self;
        _self.contentInset = UIEdgeInsetsMake(ADAPTIVE(_self.contentInset.top), ADAPTIVE(_self.contentInset.left), ADAPTIVE(_self.contentInset.bottom), ADAPTIVE(_self.contentInset.right));
    }
    
    
    
    if (self.constraints.count == 0) {
        
//        self.frame = CGRectMake(ADAPTIVE(self.frame.origin.x), ADAPTIVE(self.frame.origin.y), ADAPTIVE(self.frame.size.width), ADAPTIVE(self.frame.size.height));
//        
//        if ([self isKindOfClass:[UITabBar class]]) {
//            
//            NSLog(@"当前UITabBar ~~~~");
//        }
    }else {
        
        for (NSLayoutConstraint *c in self.constraints) {
            
            if (c.identifier.length == 0 && c.constant != 0) {
                
                c.constant = ADAPTIVE(c.constant);
            }
        }
    }

    
}

#pragma mark - private method

+ (CGFloat)adaptFontSize:(CGFloat)size
{
    return SCREENHEIGHT == 667.0f?size:(SCREENHEIGHT < 667.0f?size - 1:size + 1);
}











@end
