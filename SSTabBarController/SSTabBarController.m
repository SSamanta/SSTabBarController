//
//  SSTabBarController.m
//  SSTabBarController
//
//  Created by Susim on 6/27/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

#import "SSTabBarController.h"

@interface SSTabBarController ()
@property (nonatomic,weak)  UIView *customTabContainer;
- (IBAction)selectedTab:(id)sender;
@end

@implementation SSTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideExistingTabBar];
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"SSTabBarController" owner:self options:nil];
    self.customTabContainer = [nibObjects objectAtIndex:0];
    self.customTabContainer.frame = CGRectMake(0, self.view.frame.size.height-self.customTabContainer.frame.size.height, self.customTabContainer.frame.size.width, self.customTabContainer.frame.size.height);
    [self.view addSubview:self.customTabContainer];
    [self selectedTab:self.customTabContainer.subviews[0]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)hideExistingTabBar {
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
        }
    }
}
- (IBAction)selectedTab:(id)sender {
    UIButton *tabBtn = (UIButton *)sender;
	[self.customTabContainer.subviews enumerateObjectsUsingBlock:^(UIButton *btnObj, NSUInteger idx, BOOL *stop) {
        if (idx == tabBtn.tag) {
            [btnObj setSelected:NO];
        }else {
            [btnObj setSelected:YES];
        }
    }];
    [self setSelectedIndex:tabBtn.tag];
}
@end
