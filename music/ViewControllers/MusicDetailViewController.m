//
//  MusicDetailViewController.m
//  music
//
//  Created by lixingdong on 15/9/16.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicDetailViewController.h"
#import "DOUAudioStreamer.h"
#import "MusicEngine.h"
static void *kStatusKVOKey = &kStatusKVOKey;
static void *kDurationKVOKey = &kDurationKVOKey;
static void *kBufferingRatioKVOKey = &kBufferingRatioKVOKey;
@interface MusicDetailViewController ()
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *hashString;
@property(nonatomic,strong)LXDSong *songInfo;
@property(nonatomic,strong)UIButton  *playOrStopButton;
@property(nonatomic,strong)NSArray  *songArray;
@property(nonatomic,assign)NSInteger  currentIndex;
@end


@implementation MusicDetailViewController


-(instancetype)initWithSongArray:(NSArray *)songArray index:(NSInteger)index{
    self = [super init];
    if (self) {
        self.songArray=songArray;
        self.currentIndex=index;
        if (self.currentIndex < 0 ||self.currentIndex >= self.songArray.count) {
            self.currentIndex=0;
        }
         LXDMusicInfo *song=[_songArray objectAtIndex:_currentIndex];
        _name=song.filename;
        _hashString=song.infoHash;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupSubviews];
    [self getSongInfomation];

}
-(void)setupSubviews{

    self.navigationItem.title=_name;
    UIButton  *preButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [preButton setImage:[UIImage imageNamed:@"preButton"] forState:UIControlStateNormal];
    [preButton addTarget:self action:@selector(preButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preButton];
    _playOrStopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playOrStopButton setImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateNormal];
    [_playOrStopButton addTarget:self action:@selector(playOrStopButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playOrStopButton];
    UIButton  *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];

    
    UISlider *progressSlider = [[UISlider alloc] init];
    [progressSlider addTarget:self action:@selector(sliderProgress:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:progressSlider];

    __typeof(self) __weak weakSelf = self;

    [preButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(50);
        make.bottom.equalTo(weakSelf.view).offset(-30);
    }];
    [_playOrStopButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.centerX);
        make.bottom.equalTo(weakSelf.view).offset(-30);
    }];
    [nextButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(-50);
        make.bottom.equalTo(weakSelf.view).offset(-30);
    }];
    [progressSlider makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_playOrStopButton.top).offset(-5);
         make.left.equalTo(weakSelf.view).offset(30);
        make.right.equalTo(weakSelf.view).offset(-30);
    }];


}
- (void)sliderProgress:(UISlider *)progressSlider
{
    MusicEngine *musicEngine=[MusicEngine sharedMusicEngine];
   [musicEngine setTimeByRatio:[progressSlider value]];
}

-(void)getSongInfomation{
    [[LXDEngine sharedEngine] getSongWithHash:_hashString success:^(LXDSong *song) {
        _songInfo=song;
        [self playOrPauseStreamer:_songInfo];
    } failure:^(NSInteger statusCode, NSError *error) {
        NSLog(@"url is null");
    }];
}
-(void)preButtonClicked:(UIButton *)button{
    self.currentIndex--;
    if (self.currentIndex < 0 ||self.currentIndex >= self.songArray.count) {
        self.currentIndex=0;
    }
    LXDMusicInfo *song=[_songArray objectAtIndex:_currentIndex];
    _name=song.filename;
    _hashString=song.infoHash;
    self.navigationItem.title=_name;
    [self getSongInfomation];
}
-(void)playOrStopButtonClicked:(UIButton *)button{
    [self playOrPauseStreamer:nil];

}
-(void)nextButtonClicked:(UIButton *)button{
    self.currentIndex++;
    if (self.currentIndex < 0 ||self.currentIndex >= self.songArray.count) {
        self.currentIndex=self.songArray.count-1;
    }
    LXDMusicInfo *song=[_songArray objectAtIndex:_currentIndex];
    _name=song.filename;
    _hashString=song.infoHash;
    self.navigationItem.title=_name;
    [self getSongInfomation];
}
- (void)playOrPauseStreamer:(LXDSong *)songInfo
{
    MusicEngine *musicEngine=[MusicEngine sharedMusicEngine];
    [musicEngine play:songInfo];
    if (![musicEngine isPlaying]) {
        [_playOrStopButton setImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateNormal];
    }
    else {
        [_playOrStopButton setImage:[UIImage imageNamed:@"stopButton"] forState:UIControlStateNormal];
    }
}
@end
