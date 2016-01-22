//
//  MainTableViewCell.m
//  FEParallaxCell
//
//  Created by keso on 16/1/22.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "MainTableViewCell.h"
#define SCREENWIDTH   [[UIScreen mainScreen] bounds].size.width

@interface MainTableViewCell()

@property (strong,nonatomic) UIView      *bgView;
@property (strong,nonatomic) UIImageView *backImageView;
@property (strong,nonatomic) UILabel     *descLabel;

@end

@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)setBackImage:(NSString *)imageName description:(NSString *)desc{
    self.backImageView.frame=self.bounds;
    self.backImageView.image=[UIImage imageNamed:imageName];
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.backImageView];
    self.descLabel.text=desc;
    self.descLabel.center=CGPointMake(SCREENWIDTH/2, 75);
    [self.contentView addSubview:self.descLabel];
}

-(void)setImagOffset:(CGPoint)contentOffset tableView:(UITableView *)tablView{
    //偏移量
    CGFloat cellOffset = self.frame.origin.y - contentOffset.y;
    CGFloat percent = (cellOffset+self.frame.size.height)/(tablView.frame.size.height+self.frame.size.height);
    //偏移比例(0-1)
    CGFloat extraHeight = self.frame.size.height*OFFSET_RATE;

    CGRect frame=self.backImageView.frame;
    frame.origin.y=extraHeight*percent;
    self.backImageView.frame=frame;
}

-(void)setAdjustOffset:(CGFloat)offset{
    CGRect frame = self.backImageView.frame;
    frame.origin.y = (offset / 15.0);
    self.backImageView.frame = frame;
}

#pragma mark - getter and  setter
-(UIView *)bgView{
    if (!_bgView) {
        _bgView=[[UIView alloc]initWithFrame:self.bounds];
        _bgView.clipsToBounds=YES;
    }
    return _bgView;
}

-(UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView=[[UIImageView alloc]init];
        _backImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backImageView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _backImageView;
}

-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,SCREENWIDTH,30)];
        [_descLabel setTextAlignment:NSTextAlignmentCenter];
        [_descLabel setFont:[UIFont systemFontOfSize:14]];
        [_descLabel setTextColor:[UIColor blackColor]];
    }
    return _descLabel;
}

@end
