//
//  DynamicViewCell.h
//  ComicDemo
//
//  Created by Simon on 16/6/13.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonData.h"
@interface DynamicViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property(strong,nonatomic)NSURL *imgUrl;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@property(nonatomic,strong)JsonData *jsondata;

@end
