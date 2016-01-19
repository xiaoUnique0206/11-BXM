//
//  SelectTableViewController.m
//  GeekNews
//
//  Created by fanyanqing on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "SelectTableViewController.h"

@interface SelectTableViewController ()

@end
static NSString *const ident = @"cell";
@implementation SelectTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精选" image:[UIImage imageNamed:@"iconfont-wangluokeji"] tag:1002];
        self.dataArray = [NSMutableArray array];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(refresh:)];

    }
    return self;
}
- (void)refresh:(UIBarButtonItem *)btn
{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectTableViewCell" bundle:nil] forCellReuseIdentifier:ident];
    [self loading];

}
- (void)loading{
    [[DataRequestTool shareData] getDataWithURL:SELECTURL andBlock:^(NSData *data) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:data error:&error];
        if (error) {
            NSLog(@"错误是:%@",error);
        }else{
            [dict writeToFile:@"/Users/songqingliang/Desktop/test.plist" atomically:YES];
            NSDictionary *dic1 = [dict objectForKey:@"Tags"];
            NSDictionary *array1 = [dic1 objectForKey:@"Tag"];
            for (NSDictionary *dic2 in array1) {
                NSDictionary *dic3 = [dic2 objectForKey:@"Articles"];
                NSArray *array=[dic3 objectForKey:@"Article"];
                for (NSDictionary *diction in array) {
                    NSDictionary *dic4 = [diction objectForKey:@"Medias"];
                    NSDictionary *dic5 = [dic4 objectForKey:@"Media"];
                    Select *select1 = [Select new];
                    [select1 setValuesForKeysWithDictionary:dic5];
                    Select *select = [Select new];
                    [select setValuesForKeysWithDictionary:diction];
                    [self.dataArray addObject:select];
                    
                }
                
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"个数==%ld",self.dataArray.count);
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    Select *select = self.dataArray[indexPath.row];
    cell.select = select;
    NSLog(@"%@",select);
    return cell;

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
