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

@property (weak, nonatomic) IBOutlet UIView *imgView;

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;
//@property (nonatomic, strong) NSArray *myArray;//用来存放JSON数据的数组
@property (nonatomic, strong) JsonData *myData;
@property(nonatomic,strong)NSArray *urlsArray;
@property(nonatomic,strong)NSMutableArray *mArray;


@end
@implementation ImgViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
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
    
    NSString *httpUrl = @"http://apis.baidu.com/3023/news/channel";
    NSString *httpArg = @"id=popular&page=1";
    _myData=[[JsonData alloc]init];
    
    
    [self.myData request: httpUrl withHttpArg:httpArg whenSuccess:^(NSDictionary *dict) {
        NSDictionary *dic1=dict[@"data"];
        NSArray *jsonArray=dic1[@"article"];
        self.mArray=[[NSMutableArray alloc]init];
        for (int i=0; i<5; i++) {
            
            NSDictionary *dic = jsonArray[i];
            [self.mArray addObject:dic[@"img"]];
            NSLog(@"%@",self.mArray);
            
            NSString *imgString=dic[@"img"];
            NSLog(@"%@",imgString);
            
            
        }
        
        BHInfiniteScrollView* infinitePageView1 = [BHInfiniteScrollView
                                                   infiniteScrollViewWithFrame:CGRectMake(0, 0, self.imgView.bounds.size.width, self.imgView.bounds.size.height) Delegate:self ImagesArray:self.mArray];
        //infinitePageView1.titlesArray = titlesArray;
        infinitePageView1.dotSize = 10;
        infinitePageView1.pageControlAlignmentOffset = CGSizeMake(0, 20);
        infinitePageView1.titleView.textColor = [UIColor whiteColor];
        infinitePageView1.titleView.margin = 30;
        infinitePageView1.titleView.hidden = YES;
        infinitePageView1.scrollTimeInterval = 2;
        infinitePageView1.autoScrollToNextPage = YES;
        infinitePageView1.delegate = self;
        [self.imgView addSubview:infinitePageView1];
        
        [self performSelector:@selector(stop) withObject:nil afterDelay:5];
        [self performSelector:@selector(start) withObject:nil afterDelay:10];
        
        
        
    } ];

   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
