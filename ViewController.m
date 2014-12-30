//
//  ViewController.m
//  See
//
//  Created by 杨朋亮 on 30/12/14.
//  Copyright (c) 2014年 daozhu. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeLabel.h"
#import "EditorViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SETCOLOR(RED,GREEN,BLUE) [UIColor colorWithRed:RED/255 green:GREEN/255 blue:BLUE/255 alpha:1.0]

//RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//RGB颜色和不透明度
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]


@interface ViewController ()

@property (weak, nonatomic) IBOutlet  MarqueeLabel *autoScrollLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromRGB(0x339900)];
    
    self.autoScrollLabel.marqueeType = MLContinuous;
    [self.autoScrollLabel setFont:[UIFont systemFontOfSize:300]];
    [self.autoScrollLabel setTextColor:UIColorFromRGB(0xFFFFFF)];
    self.autoScrollLabel.scrollDuration = 10.0f;
    self.autoScrollLabel.fadeLength = 10.0f;
    self.autoScrollLabel.trailingBuffer = 30.0f;
    self.autoScrollLabel.text = @"See";
    
    self.autoScrollLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.autoScrollLabel addGestureRecognizer:tapRecognizer];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleSwipeUp)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(handleSwipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    
}
- (void)pauseTap:(UITapGestureRecognizer *)recognizer {
    MarqueeLabel *continuousLabel2 = (MarqueeLabel *)recognizer.view;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (!continuousLabel2.isPaused) {
            [continuousLabel2 pauseLabel];
        } else {
            [continuousLabel2 unpauseLabel];
        }
    }
}

-(void) handleSwipeUp{
    EditorViewController *editor = [[EditorViewController alloc] initWithData:self.autoScrollLabel];
    [self presentViewController: editor animated:YES completion:nil];
    
}

-(void) handleSwipeDown{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
