//
//  ViewController.m
//  计算字体宽度的类别
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ViewController.h"

#import "Cell.h"
#import "NSString+Size.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray *_titleArray;
}

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation ViewController

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(60, 0, 0, 0);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self.view addSubview:collectionView];
        
        [collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
        
        _collectionView = collectionView;
    }
    
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        [self collectionView];
    
    _titleArray = @[@"我的生活想拍了一场戏",@"看好戏",@"哈哈哈哈",@"😝",@"😁😁😀😀",@"我不能再回头",@"走着走着看到路标只想演艺圈",@"哈哈",@"如果选择往前走",@"叫着苹果"];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titleArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = _titleArray[indexPath.item];
    
    return cell;
}

/**
 *  返回cell的size
 *
 *  @param collectionView       <#collectionView description#>
 *  @param collectionViewLayout <#collectionViewLayout description#>
 *  @param indexPath            <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
#warning 应该提前计算好宽度，把宽度缓存起来。
    //计算宽度
    CGSize size = [_titleArray[indexPath.item] sizeWithFontSize:17 maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    return CGSizeMake(size.width + 30, size.height + 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
