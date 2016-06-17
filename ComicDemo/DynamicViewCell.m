//
//  DynamicViewCell.m
//  ComicDemo
//
//  Created by Simon on 16/6/13.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "DynamicViewCell.h"

@implementation DynamicViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    return self;
}

-(void)getData:(JsonData *)data{

    _jsondata=data;
    
    NSURL *imgUrl=[NSURL URLWithString:_jsondata.imgurl];
    //self.imageView=[UIImage imageWithData:[NSData dataWithContentsOfURL:imgUrl]];
    
    


}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
