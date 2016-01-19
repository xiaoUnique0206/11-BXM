//
//  NewsTableViewController.m
//  GeekNews
//
//  Created by fanyanqing on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "NewsTableViewController.h"

@interface NewsTableViewController ()

@property(strong,nonatomic)NSArray *dataArr;

@end

@implementation NewsTableViewController
static NSString *const identifer = @"idhskvfdsguyv";

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的新闻" image:[UIImage imageNamed:@"iconfont-home(1).png"] tag:1001];
        self.dataArr = [NSArray array];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:identifer];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self loadData];
}

- (void)loadData
{
    [[DataRequestTool shareData] getDataWithURL:NEWSURL andBlock:^(NSData *data) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:data error:&error];
        if (error)
        {
            NSLog(@"data error:%@",error);
        }
        else
        {
            NSDictionary *dataDict = [dict objectForKey:@"Articles"];
            NSArray *arr = [dataDict objectForKey:@"Article"];
            NSMutableArray *dataArr = [NSMutableArray array];
            for (NSDictionary *subDict in arr)
            {
                ArticleItem *item = [[ArticleItem alloc] init];
                [item setValuesForKeysWithDictionary:subDict];
                //NSLog(@"item:%@",item);
                [dataArr addObject:item];
            }
            self.dataArr = dataArr;

        }
        [self.tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    NSLog(@"count:%ld",self.dataArr.count);
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    
    ArticleItem *item = [[ArticleItem alloc] init];
    item = self.dataArr[indexPath.row];
    cell.item = item;
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (H-206)/2;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
