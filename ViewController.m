//
//  ViewController.m
//  See
//
//  Created by 杨朋亮 on 30/12/14.
//  Copyright (c) 2014年 daozhu. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeLabel.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet  MarqueeLabel *autoScrollLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.autoScrollLabel.enabled = YES;
    [self.view addSubview:self.autoScrollLabel];
    
    self.autoScrollLabel.marqueeType = MLContinuous;
    [self.autoScrollLabel setFont:[UIFont systemFontOfSize:300]];
    self.autoScrollLabel.scrollDuration = 10.0f;
    self.autoScrollLabel.fadeLength = 10.0f;
    self.autoScrollLabel.trailingBuffer = 30.0f;
    self.autoScrollLabel.text = @"See";
    
    self.autoScrollLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.autoScrollLabel addGestureRecognizer:tapRecognizer];
    
    [self.autoScrollLabel restartLabel];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
