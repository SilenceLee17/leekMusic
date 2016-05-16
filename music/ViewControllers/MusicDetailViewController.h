//
//  MusicDetailViewController.h
//  music
//
//  Created by lixingdong on 15/9/16.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicBaseViewController.h"

@interface MusicDetailViewController : MusicBaseViewController
-(instancetype)initWithSongArray:(NSMutableArray *)songArray index:(NSInteger)index;
@end
