//
//  UserViewController.m
//  ComicDemo
//
//  Created by Simon on 16/6/11.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "UserViewController.h"
#import "Public.h"
#import "LoginViewCell.h"
#import "NewsViewCell.h"
#import "DowlodViewCell.h"
#import "OtherTableViewCell.h"
@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate>{

NSMutableArray *_dataSourceArray;
    
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self initData];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section!=3) {
        return 1;
    }else {
        return 6;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 70;
    }else{
        return 40;
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
        static NSString *cellIndentifier=@"loginCell";
        LoginViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LoginViewCell" owner:self options:nil] firstObject];
        }
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
    }else if(indexPath.section == 1){
        static NSString *cellIndentifier=@"NewsCell";
        NewsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsViewCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2){
        static NSString *cellIndentifier=@"DowlodCell";
        DowlodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DowlodViewCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else{
        static NSString *cellIndentifier=@"OtherCell";
        OtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            //IB中创建cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OtherTableViewCell" owner:self options:nil] lastObject];
        }
        cell.textLabel.font=[UIFont systemFontOfSize:13];
        cell.textLabel.text=[_dataSourceArray[indexPath.row] objectForKey:@"title"];
        //NSString *imgStr = [_dataSourceArray[indexPath.row] objectForKey:@"image"];
        //cell.imageView.image = [UIImage imageNamed:imgStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}

-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setObject:@"历史记录" forKey:@"title"];
    //[dic1 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic1];
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setObject:@"我的收藏" forKey:@"title"];
    //[dic2 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic2];
    NSMutableDictionary *dic3 = [[NSMutableDictionary alloc] init];
    [dic3 setObject:@"我的关注" forKey:@"title"];
    //[dic3 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic3];
    NSMutableDictionary *dic4 = [[NSMutableDictionary alloc] init];
    [dic4 setObject:@"我的钱包" forKey:@"title"];
    //[dic4 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic4];
    NSMutableDictionary *dic5 = [[NSMutableDictionary alloc] init];
    [dic5 setObject:@"夜间模式" forKey:@"title"];
    //[dic5 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic5];
    NSMutableDictionary *dic6 = [[NSMutableDictionary alloc] init];
    [dic6 setObject:@"软件设置" forKey:@"title"];
    //[dic6 setObject:@"icon_mine_onsite" forKey:@"image"];
    [_dataSourceArray addObject:dic6];
    
}

@end
