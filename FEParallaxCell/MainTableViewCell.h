//
//  MainTableViewCell.h
//  FEParallaxCell
//
//  Created by keso on 16/1/22.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#define OFFSET_RATE 0.5

@interface MainTableViewCell : UITableViewCell

-(void)setBackImage:(NSString *)imageName description:(NSString *)desc;

//视差滑动方式1
-(void)setImagOffset:(CGPoint)contentOffset tableView:(UITableView *)tablView;

//视差滑动方式2
-(void)setAdjustOffset:(CGFloat)offset;

@end
