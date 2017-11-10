//
//  SugueViewController.m
//  ScanProject
//
//  Created by 徐征 on 2017/11/9.
//  Copyright © 2017年 惠通互娱Macbook Air. All rights reserved.
//

#import "SugueViewController.h"
#import "PushYellowViewController.h"

@interface SugueViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *segueBtns;

@property (weak, nonatomic) IBOutlet UIView *organeView;
@property (weak, nonatomic) IBOutlet UIView *cyanView;

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation SugueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.organeView.hidden = NO;
    self.cyanView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pullCodeDescrView) name:@"haha" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"haha" object:nil];
}

- (void)pullCodeDescrView {
    NSLog(@"传过来了哈哈😆");
}


//Unwind Segue 需要添加的方法
- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
//    UIViewController *sourceViewController = sender.sourceViewController;
}


- (IBAction)clickSegueBtn:(UIButton *)sender {
    
    NSString *segueId = sender.titleLabel.text;
    if (sender.tag == 13) {
        [self.navigationController performSegueWithIdentifier:segueId sender:nil];
    }else
    {
        [self performSegueWithIdentifier:segueId sender:nil];
    }
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if ([identifier isEqualToString:@"orange"]) {
//        return NO;
//    }else
//    {
//        return YES;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"orange"]) {
        NSLog(@"orange");
    }else if ([segue.identifier isEqualToString:@"pushYellow"])
    {
        //正向传值
        PushYellowViewController *yellowVC = segue.destinationViewController;
        yellowVC.stringY = @"传给Yellow";
        
        //反向传值
        __weak typeof(self)  weakSelf = self;
        yellowVC.block = ^(NSString *string) {
            NSLog(@"%@",string);
            weakSelf.label.text = string;
        };
        
        NSLog(@"cyan");
    }
}


@end
