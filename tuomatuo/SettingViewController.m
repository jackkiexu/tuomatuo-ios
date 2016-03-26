//
//  SettingViewController.m
//  tuomatuo
//
//  Created by xjk on 3/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSMutableArray *contentArray;
@property (nonatomic,strong) UIImageView *headImgView;

@end

@implementation SettingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self layoutSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _contentArray = [NSMutableArray array];
    [_contentArray addObject:@"未设置"];
    [_contentArray addObject:@"男"];
    [_contentArray addObject:@"男"];

    NSLog(@"arr:%@",_contentArray);
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 75*PERCENT_WIDTH;
    }
    return 45*PERCENT_WIDTH;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
        lineView.backgroundColor = [UIColor whiteColor];
        [cell addSubview:lineView];
        [lineView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(cell);
            make.height.equalTo(@1);
        }];
        
        if (indexPath.row == 0) {
            _headImgView = [UIImageView new];
            NSURL *URL = [NSURL URLWithString:@"http://7u2k3q.com2.z0.glb.qiniucdn.com/avatar/4/5/4/1/131454.jpeg?imageMogr2/auto-orient/crop/!480x480a75a39/thumbnail/148x148/1457963931"];
            [_headImgView sd_setImageWithURL:URL];
            
            
            [cell addSubview:_headImgView];
            [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell);
                make.right.equalTo(cell.right).offset(-30);
                make.width.height.mas_equalTo(35);
            }];
            _headImgView.layer.masksToBounds = YES;
            _headImgView.layer.cornerRadius = 35/2;
        }else{
            UILabel *label = [UILabel new];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont fontWithName:FontName size:14];
            label.textColor = FTColor_Black_2;
            label.tag = indexPath.row+1;
            [cell addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell);
                make.right.equalTo(cell.right).offset(-30);
            }];
        }
    }
    if (indexPath.row > 0) {
        if (self.contentArray.count > 0) {
            UILabel *label = (UILabel *)[cell viewWithTag:indexPath.row+1];
            label.text = [self.contentArray objectAtIndex:indexPath.row-1];
            if (indexPath.row == 2) {
                label.font = [UIFont fontWithName:FontName size:14];
                label.textColor = FTColor_Black_3;
                label.text = @"15221884515";
            }
        }
    }
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row + 1) {
        case 1:{
            UIActionSheet *act = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
            [act showInView:self.view];
        }
            break;
        case 2:
            //昵称
            [self performSegueWithIdentifier:@"pushSetNick" sender:self];
            break;
        case 3:
            //手机
            [self performSegueWithIdentifier:@"pushSetMobile" sender:self];
            break;
        case 4:
            //性别
            [self performSegueWithIdentifier:@"pushSetSex" sender:self];
            break;
            
        default:
            break;
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUInteger sourceType = 0;
    NSLog(@"buttonIndex=%ld",buttonIndex);
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex+1) {
            case 1:
                //拍照
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 2:
                //相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                
                break;
            case 3:
                //取消
                return;
                
            default:
                break;
        }
    }else{
        if (buttonIndex == 2) {
            return;
        } else {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *theImg=[info valueForKey:UIImagePickerControllerOriginalImage];
    float scale = 960/(theImg.size.width<theImg.size.height ? theImg.size.width:theImg.size.width);
    CGSize newSize = CGSizeMake(theImg.size.width*scale, theImg.size.height*scale);
    UIGraphicsBeginImageContext(newSize);
    [theImg drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    theImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *compressionData = [UIImage compressionImageWithImage:theImg];
    NSLog(@"data:%ld k",[compressionData length]/1024);
    
    
    _headImgView.image = theImg;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}




#pragma  mark -
- (void)layoutSubViews
{
    [self.view addSubview:self.tableView];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
}

- (NSArray *)array
{
    if (!_array) {
        _array = @[@"头像",@"昵称",@"手机",@"性别"];
    }
    return _array;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        headerView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = headerView;
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
