//
//  RegisterController.h
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WelcomeScrollView;

@interface LCRegisterController : UIViewController

@property (nonatomic, strong) WelcomeScrollView *scrollView;

- (void)dismiss;
@end
