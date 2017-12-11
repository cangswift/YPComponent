//
//  ZHBaseTableCell.h
//
//  Created by Apple on 2017/4/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/**TableViewCell基类*/
@interface DDBaseTableCell : UITableViewCell

/**自定义cell分割线，默认隐藏*/
@property (nonnull , nonatomic , strong , readonly) UIImageView *separator;
/**自定义cell箭头，默认隐藏、居中、右边偏移10*/
@property (nonnull , nonatomic , strong , readonly) UIImageView *arrow;
/**向右箭头图片*/
@property (nullable , nonatomic , strong) UIImage *arrowImg;

@end
