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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self.autoScrollLabel setText:textView.text];
}

-(IBAction) okAction:(id)sender{
    [self.autoScrollLabel setText:self.inputTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
