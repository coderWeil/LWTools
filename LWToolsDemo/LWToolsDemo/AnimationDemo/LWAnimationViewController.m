//
//  LWAnimationViewController.m
//  LWToolsDemo
//
//  Created by weil on 2018/5/10.
//  Copyright © 2018年 weil. All rights reserved.
//

#import "LWAnimationViewController.h"
#import "LWAnimationView.h"

@interface LWAnimationViewController ()
@property (nonatomic,strong) LWAnimationView *loadingView;
@end

@implementation LWAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _loadingView = [[LWAnimationView alloc] init];
    _loadingView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    _loadingView.bounds = CGRectMake(0, 0, 100, 40);
    [self.view addSubview:_loadingView];
    _loadingView.color = [UIColor redColor];
    _loadingView.padding = 0;
    _loadingView.backgroundColor = [UIColor clearColor];
    [_loadingView stopAnimation];
    _loadingView.animationStyle = LWAnimationViewStyleLineScale;
    [_loadingView startAnimation];
    touchTimes++;
}
static NSInteger touchTimes = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _loadingView.bounds = CGRectMake(0, 0, 100, 40);
    switch (touchTimes) {
        case 0:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleLineScale;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 1:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleLineScaleParty;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 2:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleLinePulseOut;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 3:
            [_loadingView stopAnimation];
            _loadingView.bounds = CGRectMake(0, 0, 100, 50);
            _loadingView.animationStyle = LWAnimationViewStyleLineAudioEqualizer;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 4:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallBeat;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 5:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallClipRotate;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 6:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallClipRotateMultiple;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 7:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallClipRotatePulse;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 8:
            [_loadingView stopAnimation];
            _loadingView.bounds = CGRectMake(0, 0, 200, 100);
            _loadingView.animationStyle = LWAnimationViewStyleBallGridBeat;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 9:
            [_loadingView stopAnimation];
            _loadingView.bounds = CGRectMake(0, 0, 200, 100);
            _loadingView.animationStyle = LWAnimationViewStyleBallGridPulse;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 10:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallPulse;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 11:
            [_loadingView stopAnimation];
            _loadingView.bounds = CGRectMake(0, 0, 200, 100);
            _loadingView.animationStyle = LWAnimationviewstyleBallPulseRise;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 12:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallPulseSyn;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 13:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallRotate;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 14:
            [_loadingView stopAnimation];
            _loadingView.bounds = CGRectMake(0, 0, 200, 100);
            _loadingView.animationStyle = LWAnimationViewStyleBallRotateChase;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 15:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallScale;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 16:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallScaleMultiple;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 17:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallScaleRipple;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 18:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallScaleRippleMultiple;
            [_loadingView startAnimation];
            touchTimes++;
            break;
        case 19:
            [_loadingView stopAnimation];
            _loadingView.animationStyle = LWAnimationViewStyleBallSpinFadeLoad;
            [_loadingView startAnimation];
            touchTimes = 0;
            break;
        default:
            break;
    }
    
}


@end
