//
//  JsonData.h
//  ComicDemo
//
//  Created by Simon on 16/6/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonData : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *pushUrl;
@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSArray *jsonArray;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)NSDictionary *dic1;


@property(nonatomic,strong)NSString *httpUrl;
@property(nonatomic,strong)NSString *httpArg;

-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg whenSuccess:(void (^)(NSDictionary *))success;
-(void) getdata;//在HomeViewController中执行此方法从而得到JSON数据

@end
