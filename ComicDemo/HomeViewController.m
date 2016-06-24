//
//  HomeViewController.m
//  ComicDemo
//
//  Created by Simon on 16/6/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "HomeViewController.h"
#import "JsonData.h"
#import "Public.h"
#import "ImgViewCell.h"
#import "PopViewCell.h"
#import "DynamicViewCell.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) JsonData *myData;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置选择中的颜色
   //[self.tabBarController.tabBar setTintColor:[UIColor orangeColor]];
   // self.tabBarController.tabBar.selectedImageTintColor = [UIColor orangeColor];  IOS 8.0
    
    self.view.backgroundColor=[UIColor grayColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section!=2) {
        return 1;
    }else {
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }else if(indexPath.section==1){
        return 180;
    }else{
        return 70;
    
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section == 0) {
        static NSString *cellIndentifier=@"ImgCell";
        ImgViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            //IB中创建cell
         cell = [[[NSBundle mainBundle] loadNibNamed:@"ImgViewCell" owner:self options:nil] firstObject];
            

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        static NSString *cellIndentifier=@"PopCell";
        PopViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PopViewCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellIndentifier=@"DynamicCell";
        DynamicViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DynamicViewCell" owner:self options:nil] lastObject];

        }
        NSString *httpUrl = @"http://apis.baidu.com/3023/news/channel";
        NSString *httpArg = @"id=popular&page=1";
        _myData=[[JsonData alloc]init];
        
        [self.myData request: httpUrl withHttpArg:httpArg whenSuccess:^(NSDictionary *dict) {
            NSDictionary *dic1=dict[@"data"];
            NSArray *jsonArray=dic1[@"article"];
            NSDictionary *dic = jsonArray[indexPath.row];
            NSString *data=dic[@"title"];
            NSString *content=dic[@"author"];
            cell.titleLable.text=data;
            cell.titleLable.numberOfLines=0;
            cell.contentLable.text=content;
            

            NSString *imgString=dic[@"img"];
            NSURL *imgURL=[NSURL URLWithString:imgString];
            
            cell.imgView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:imgURL]];
            
            
        } ];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
