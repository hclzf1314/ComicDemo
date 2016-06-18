//
//  ImgViewCell.m
//  ComicDemo
//
//  Created by Simon on 16/6/13.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "ImgViewCell.h"
#import "BHInfiniteScrollView.h"
#import "JsonData.h"
@interface ImgViewCell ()<BHInfiniteScrollViewDelegate>

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;
//@property (nonatomic, strong) NSArray *myArray;//用来存放JSON数据的数组
@property (nonatomic, strong) JsonData *myData;
@property(nonatomic,strong)NSArray *urlsArray;


@end
@implementation ImgViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSString *httpUrl = @"http://apis.baidu.com/3023/news/channel";
        NSString *httpArg = @"id=popular&page=1";
        _myData=[[JsonData alloc]init];
  
        
        [self.myData request: httpUrl withHttpArg:httpArg whenSuccess:^(NSDictionary *dict) {
            NSDictionary *dic1=dict[@"data"];
            NSArray *jsonArray=dic1[@"article"];
        for (int i=0; i<5; i++) {
   
            NSDictionary *dic = jsonArray[i];
            NSString *imgString=dic[@"img"];
            NSArray *urlsArray =@[@"%@",imgString];
      }
        } ];
        /*
         NSArray* urlsArray =@[
         @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646722_1456498424671_800x600.jpg",
         @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646649_1456498410838_800x600.jpg",
         @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646706_1456498430419_800x600.jpg",
         @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646723_1456498427059_800x600.jpg",
         @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1602/26/c0/18646705_1456498422529_800x600.jpg"
         ];
         */
        
        
        BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                                   infiniteScrollViewWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) Delegate:self ImagesArray:self.urlsArray];
        //infinitePageView1.titlesArray = titlesArray;
        infinitePageView1.dotSize = 10;
        infinitePageView1.pageControlAlignmentOffset = CGSizeMake(0, 20);
        infinitePageView1.titleView.textColor = [UIColor whiteColor];
        infinitePageView1.titleView.margin = 30;
        infinitePageView1.titleView.hidden = YES;
        infinitePageView1.scrollTimeInterval = 2;
        infinitePageView1.autoScrollToNextPage = YES;
        infinitePageView1.delegate = self;
        [self addSubview:infinitePageView1];
        
        [self performSelector:@selector(stop) withObject:nil afterDelay:5];
        [self performSelector:@selector(start) withObject:nil afterDelay:10];
        

        
    }
    return self;
}
- (void)stop {
    [_infinitePageView stopAutoScrollPage];
}

- (void)start {
    [_infinitePageView startAutoScrollPage];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
