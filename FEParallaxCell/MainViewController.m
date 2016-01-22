//
//  ViewController.m
//  FEParallaxCell
//
//  Created by keso on 16/1/22.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"

#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height
#define CELLIDENTIFIER @"CELLIDENTIFIER"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)  UITableView *tableView;
@property (strong,nonatomic)  NSMutableArray *dataSource;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configNavigation];
    [self configTableView];
}

-(void)viewWillAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITablViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *mainCell=[tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER forIndexPath:indexPath];
    NSString *desc=[NSString stringWithFormat:@"FlyElephant-%ld",indexPath.row];
    [mainCell setBackImage:self.dataSource[indexPath.row] description:desc];
    return mainCell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset=self.tableView.contentOffset;
    for (MainTableViewCell *cell in self.tableView.visibleCells) {
        //方式1
//        [cell setImagOffset:offset tableView:self.tableView];
        //方式2
        [cell setAdjustOffset:(cell.frame.origin.y-offset.y)];
        
        
    }
}
#pragma mark - getter and setter
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:CELLIDENTIFIER];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc]init];
    }
    return _dataSource;
}

#pragma  mark - config method
-(void)configTableView{
    for (NSInteger i=1; i<=100; i++) {
        int num=random()%6+1;
        [self.dataSource addObject:[NSString stringWithFormat:@"Girl%d",num]];
    }
    [self.view addSubview:self.tableView];
}

-(void)configNavigation{
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationItem setTitle:@"视差滚动"];
}

@end

