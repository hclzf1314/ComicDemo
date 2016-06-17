//
//  JsonData.m
//  ComicDemo
//
//  Created by Simon on 16/6/12.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData

-(void) getdata{
    
    
    }
    
-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg whenSuccess:(void (^)(NSDictionary *))success{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"3ea3ba636f1e64731c22c5ae3a331ff4" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                               } else {
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   NSLog(@"HttpResponseCode:%ld", responseCode);
                                   
                                   
                                   
                                   
                                   dispatch_queue_t mainQueue = dispatch_get_main_queue();
                                   //异步返回主线程，根据获取的数据，更新UI
                                   dispatch_async(mainQueue, ^{
                                       NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: nil];
                                       
                                       success(dictionary);
                                       NSLog(@"根据更新UI界面");
                                   });
                                   
                                   
                                   
                                   NSLog(@"%@", self.dic[@"title"]);
                                   
                               }
                           }];
    
}



@end
