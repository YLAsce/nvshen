//
//  HLStatusCellTableViewCell.m
//  nvshen
//
//  Created by hoolang on 15/5/28.
//  Copyright (c) 2015年 Hoolang. All rights reserved.
//


#import "HLStatusCell.h"

#import "HLStatusToolbar.h"


@interface HLStatusCell()


/** 工具条 */
@property (nonatomic, weak) HLStatusToolbar *toolbar;

@end

@implementation HLStatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HLStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HLStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    HLLog(@"initWithStyle SSSS");
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置选中时的背景为蓝色
        //        UIView *bg = [[UIView alloc] init];
        //        bg.backgroundColor = [UIColor blueColor];
        //        self.selectedBackgroundView = bg;
        
        // 这个做法不行
        //        self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
        
        // 初始化原创show
        [super setupOriginal];
        
        // 初始化工具条
        [self setupToolbar];
    }
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y += HWStatusCellMargin;
//    [super setFrame:frame];
//}

/**
 * 初始化工具条
 */
- (void)setupToolbar
{
    HLStatusToolbar *toolbar = [HLStatusToolbar toolbar];
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}
@end