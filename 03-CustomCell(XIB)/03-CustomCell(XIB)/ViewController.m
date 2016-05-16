//
//  ViewController.m
//  03-CustomCell(XIB)
//
//  Created by qingyun on 16/5/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell1.h"
#import "QYTableViewCell2.h"
#import "QYModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
static NSString *identifier1 = @"cell1";
static NSString *identifier2 = @"cell2";
//懒加载datas
-(NSArray *)datas{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Temp" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYModel *model = [QYModel modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
    }
    return _datas;
}

-(UITableView *)tableView{
    if (_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        //设置数据源和代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //行高
        _tableView.rowHeight = 100;
        
        //注册单元格(利用nib文件来注册单元格)
        NSString *nibName = NSStringFromClass([QYTableViewCell1 class]);
        UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
        [_tableView registerNib:nib forCellReuseIdentifier:identifier1];
        
        NSString *nibName2 = NSStringFromClass([QYTableViewCell2 class]);
        UINib *nib2 = [UINib nibWithNibName:nibName2 bundle:nil];
        [_tableView registerNib:nib2 forCellReuseIdentifier:identifier2];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableView
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
#if 0
    static NSString *identifier = @"cell1";
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil][0];
    }
#else
    //获取当前cell对应的模型
    QYModel *model = self.datas[indexPath.row];
    if ([model.status integerValue] == 0) {
        QYTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:identifier1 forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }else if ([model.status integerValue] == 1){
        QYTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:identifier2 forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
#endif
    
    return nil;
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
