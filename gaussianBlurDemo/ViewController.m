//
//  ViewController.m
//  gaussianBlurDemo
//
//  Created by Jason Liang on 3/11/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Additions.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *sourceImageInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *qualitySliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *radiusSliderLabel;
@property (weak, nonatomic) IBOutlet UIButton *renderButton;
@property (weak, nonatomic) IBOutlet UISlider *qualitySlider;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;

@property (strong, nonatomic) UIImage *sourceImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sourceImage = [UIImage imageNamed:@"halftree"];
//    self.sourceImage = [UIImage imageNamed:@"Untitled"];
    self.backgroundImageView.image = self.sourceImage;
}

- (IBAction)qualityValueChanged:(id)sender {
    self.qualitySliderLabel.text = [NSString stringWithFormat:@"q:%f", self.qualitySlider.value];
}

- (IBAction)radiusValueChanged:(id)sender {
    self.radiusSliderLabel.text = [NSString stringWithFormat:@"r:%f", self.radiusSlider.value];
}

- (IBAction)renderButtonTapped {
    
    NSDate *start = [NSDate date];
    
    self.backgroundImageView.image = [UIImage gaussianBlurImage:self.sourceImage radius:self.radiusSlider.value quality:self.qualitySlider.value sizeUpTo:self.backgroundImageView.frame.size];
    
    
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:start];
    
    self.sourceImageInfoLabel.text = [NSString stringWithFormat:@"source image size is %@, rendering time is %f seconds", NSStringFromCGSize(self.sourceImage.size), executionTime];
    
    NSLog(@"Execution Time: %f", executionTime);
}

@end
