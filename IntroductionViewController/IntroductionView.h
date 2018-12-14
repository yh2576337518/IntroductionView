//
//  IntroductionView.h
//  IntroductionViewController
//
//  Created by 惠上科技 on 2018/12/14.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef void (^IntroductionSelectedEnter)(void);

@interface IntroductionView : UIView

@property (nonatomic, strong) UIScrollView *pagingScrollView;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, assign) BOOL hiddenEnterButton;//default is NO
@property (nonatomic, assign) BOOL autoScrolling;//default is NO
@property (nonatomic, assign) BOOL autoLoopPlayVideo;//default is YES

@property (nonatomic, copy) IntroductionSelectedEnter didSelectedEnter;

@property (nonatomic, strong) UIView *coverView;//default is nil
@property (nonatomic, assign) CGPoint pageControllOffset;//default is {0,-30}

/**
 @[@"image1",@"image2"]
 */
@property (nonatomic, strong) NSArray *backgroundImageNames;

/**
 @[@"coverImage1",@"coverImage2"]
 */
@property (nonatomic, strong) NSArray *coverImageNames;

/**
 @[@"make the world",@"the better place"]
 */
@property (nonatomic, strong) NSArray *coverTitles;
@property (nonatomic, strong) NSDictionary *labelAttributes;

/**
 video volume
 */
@property (nonatomic, assign) float volume;

- (id)initWithCoverImageNames:(NSArray *)coverNames;

- (id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames;

- (id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames button:(UIButton *)button;

// default volume is 0
- (id)initWithVideo:(NSURL *)videoURL;

- (id)initWithVideo:(NSURL *)videoURL volume:(float)volume;


@end

