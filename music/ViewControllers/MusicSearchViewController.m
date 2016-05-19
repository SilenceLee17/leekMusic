//
//  SearchViewController.m
//  music
//
//  Created by lixingdong on 15/9/9.
//  Copyright (c) 2015年 lixingdong. All rights reserved.
//

#import "MusicSearchViewController.h"
#import "MusicSearchCell.h"
#import "UIColor+Music.h"
#import "MusicDetailViewController.h"
#define MusicCellHeight 55
static NSString *const kSearchReuseIdentifier = @"searchCellIdentifier";

@interface MusicSearchViewController () <UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) LXDMusic *musicSearch;


@end

@implementation MusicSearchViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupSubviews];
    //键盘默认显示
    [_searchBar becomeFirstResponder];



}
- (void)setupSubviews{
    self.navigationItem.title = @"搜索";
    self.view.backgroundColor=[UIColor greenColor];

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView registerClass:[MusicSearchCell class] forCellReuseIdentifier:kSearchReuseIdentifier];
    _tableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:134/255.0 blue:154/255.0 alpha:1];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];


    _searchBar=[[UISearchBar  alloc] init];
    _searchBar.tintColor=[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f];
    _searchBar.delegate=self;
    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.placeholder=[NSString stringWithCString:"请输入需要查找的文本内容"  encoding: NSUTF8StringEncoding];
    _searchBar.backgroundImage = [UIColor imageWithColor:[UIColor colorWithRed:215/255.0 green:0/255.0  blue:64/255.0  alpha:1] andSize:CGSizeMake(1, 1)];
    [self.view addSubview:_searchBar];


    __typeof(self) __weak weakSelf = self;
    [_searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(44);
    }];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_searchBar.bottom);
        make.right.left.bottom.equalTo(weakSelf.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _musicSearch.data.info.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:kSearchReuseIdentifier forIndexPath:indexPath];
    if (indexPath.row >= 0&&indexPath.row < _musicSearch.data.info.count) {
        LXDMusicInfo *song=_musicSearch.data.info[indexPath.row];
        [cell setName:song.filename];
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = MusicCellHeight;
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= 0&&indexPath.row < _musicSearch.data.info.count) {

        MusicDetailViewController *vc=[[MusicDetailViewController alloc] initWithSongArray:_musicSearch.data.info index:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
 NSLog(@"searchBarSearchButtonClicked is %@",searchBar.text);
    [[LXDEngine sharedEngine] getSearchListWithKeyWord:searchBar.text
                                               success:^(LXDMusic *musicSearch){
                                                   _musicSearch=musicSearch;
                                                   [self.tableView reloadData];
                                                   [_searchBar resignFirstResponder];
                                                   NSLog(@"success");
                                               }
                                               failure:^(NSInteger statusCode, NSError *error){
                                                    NSLog(@"failure");
                                               }];
}
 - (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"textDidChange %@ searchBar %@",searchText,searchBar.text);
}
@end
