//
//  EditorViewController.m
//  See
//
//  Created by 杨朋亮 on 30/12/14.
//  Copyright (c) 2014年 daozhu. All rights reserved.
//

#import "EditorViewController.h"
#import "MarqueeLabel.h"


@interface EditorViewController ()

@property (weak,nonatomic) IBOutlet UITextView   *inputTextView;

@property (nonatomic,weak) MarqueeLabel *autoScrollLabel;

@end

@implementation EditorViewController

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.autoScrollLabel = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputTextView.delegate = self;
    [self.inputTextView setText:self.autoScrollLabel.text];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    tapGesture.numberOfTapsRequired = 1;
    [tapGesture addTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(handleSwipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self animateTextField:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self animateTextField:NO];
}

-(void) handleSwipeDown{
    
    [self.autoScrollLabel setText:self.inputTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)animateTextField:(BOOL)up
{
    
    const int movementDistance = 40;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    [UIView setAnimationDuration: movementDuration];
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            self.view.frame = CGRectOffset(self.view.frame,0, movement);
        }else{
            self.view.frame = CGRectOffset(self.view.frame,0, -movement);
        }
    }else{
        if (orientation == UIInterfaceOrientationPortrait) {
            self.view.frame = CGRectOffset(self.view.frame, movement,0);
        }else{
            self.view.frame = CGRectOffset(self.view.frame,  -movement,0);
        }
    }
    [UIView commitAnimations];
    
}

-(void)tapAction:(id)sender{
    [self.inputTextView resignFirstResponder];
}

@end
