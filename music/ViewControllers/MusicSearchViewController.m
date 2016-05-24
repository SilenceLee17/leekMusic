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
#import "DBSphereView.h"
#import "UIColor+Music.h"
#import "MusicBackgroundView.h"
#import "MusicPlayController.h"
#define MusicCellHeight 55
static NSString *const kSearchReuseIdentifier = @"searchCellIdentifier";

@interface MusicSearchViewController () <UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) LXDMusic *musicSearch;
@property (nonatomic, strong) DBSphereView *sphereView;
@property (nonatomic, strong) NSArray *searchNameArray;
@property (nonatomic, strong) MusicPlayController *playController;

@end

@implementation MusicSearchViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    MusicPlayController *playController = [[MusicPlayController alloc] init];
    MusicBackgroundView *backgroundView = [[MusicBackgroundView alloc] init];
    self.view = backgroundView;
    [self.view addSubview:playController.view];

    [self setupSubviews];
    [self gainData];
    [self addShowTagView];
    [playController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)setupSubviews{
    self.navigationItem.title = @"搜索";
    UIColor *backgroundColor = [UIColor colorWithRed:1.0f green:220/255.0f blue:220/255.0f alpha:1.0f];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView registerClass:[MusicSearchCell class] forCellReuseIdentifier:kSearchReuseIdentifier];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    _tableView.hidden = YES;

    _sphereView = [[DBSphereView alloc] init];
    [self.view addSubview:_sphereView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEditSearchBar:)];
    [_sphereView addGestureRecognizer:tap];

    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
    [_searchBar endEditing:YES];
    _searchBar.tintColor=backgroundColor;
    _searchBar.delegate=self;
    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.placeholder=[NSString stringWithCString:"请输入您想要的歌曲                                     "  encoding: NSUTF8StringEncoding];
    UITextField *textfield = [_searchBar valueForKey:@"_searchField"];
    [textfield setValue:[UIColor colorWithRed:0.9f green:0.9f blue:1.0f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
    _searchBar.backgroundImage = [UIColor imageWithColor:[UIColor clearColor] andSize:CGSizeMake(1, 1)];
    [self.view addSubview:_searchBar];

    __typeof(self) __weak weakSelf = self;
    [_searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(20);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(44);
    }];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_searchBar.bottom);
        make.right.left.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(-50);
    }];
    [_sphereView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_searchBar.bottom).offset(20);
        make.right.left.bottom.equalTo(weakSelf.view);
    }];
}

- (void)gainData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SearchNamePlist" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *string = dict[@"online_params"][@"KeyWord"];
    _searchNameArray = [string componentsSeparatedByString:@","];
}

- (void)addShowTagView
{

    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    NSInteger count = _searchNameArray.count;
    for (NSInteger i = 0; i < 50; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_searchNameArray[(i * 4 + arc4random()% 4)%count] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor randomColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18.];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setCloudTags:array];
    _sphereView.backgroundColor = [UIColor clearColor];
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
                                                   self.tableView.hidden = NO;
                                                   self.sphereView.hidden = YES;
                                                   [self.tableView reloadData];
                                                   [_searchBar resignFirstResponder];
                                                   NSLog(@"success");
                                               }
                                               failure:^(NSInteger statusCode, NSError *error){
                                                    NSLog(@"failure");
                                               }];
}
 - (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
     if (searchText.length == 0) {
         self.tableView.hidden = YES;
         self.sphereView.hidden = NO;
     }
    NSLog(@"textDidChange %@ searchBar %@",searchText,searchBar.text);
}

- (void)buttonPressed:(UIButton *)button {
    _searchBar.text = button.titleLabel.text;
    [[LXDEngine sharedEngine] getSearchListWithKeyWord:_searchBar.text
                                               success:^(LXDMusic *musicSearch){
                                                   _musicSearch=musicSearch;
                                                   self.tableView.hidden = NO;
                                                   self.sphereView.hidden = YES;
                                                   [self.tableView reloadData];
                                                   [_searchBar resignFirstResponder];
                                                   NSLog(@"success");
                                               }
                                               failure:^(NSInteger statusCode, NSError *error){
                                                   NSLog(@"failure");
                                               }];}

- (void)endEditSearchBar:(id)sender {
    [self.searchBar resignFirstResponder];
}
@end
