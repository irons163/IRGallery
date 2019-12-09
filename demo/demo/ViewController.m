//
//  ViewController.m
//  demo
//
//  Created by Phil on 2019/11/20.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "ViewController.h"
#import "ImagesTableViewCell.h"
#import <IRGallery/IRGallery.h>

@interface ViewController ()<IRGalleryViewControllerDelegate> {
    NSArray *images;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:ImagesTableViewCell.identifier bundle:nil] forCellReuseIdentifier:ImagesTableViewCell.identifier];
    
    images = @[@"1.png",@"2.png",@"3.png"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [images count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImagesTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[ImagesTableViewCell identifier]];
    UIImage *image = [UIImage imageNamed:images[indexPath.row]];
    cell.thumbImageView.image = image;
    cell.titleLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    IRGalleryViewController *galleryVC = [[IRGalleryViewController alloc] initWithPhotoSource:self];
    galleryVC.startingIndex = indexPath.row;
    galleryVC.useThumbnailView = FALSE;
    galleryVC.delegate = self;
    [galleryVC gotoImageByIndex:indexPath.row animated:NO];
    [self.navigationController pushViewController:galleryVC animated:YES];
}

#pragma mark - IRGalleryViewControllerDelegate

- (int)numberOfPhotosForPhotoGallery:(IRGalleryViewController *)gallery {
    return images.count;
}

- (IRGalleryPhotoSourceType)photoGallery:(IRGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index {
    return IRGalleryPhotoSourceTypeLocal;
}

- (NSString*)photoGallery:(IRGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index {
    NSString *filename = [NSString stringWithFormat:@"%d", index + 1];
    return [[filename pathComponents] lastObject];
}

- (NSString*)photoGallery:(IRGalleryViewController *)gallery urlForPhotoSize:(IRGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return nil; // network url
}

- (NSString*)photoGallery:(IRGalleryViewController*)gallery filePathForPhotoSize:(IRGalleryPhotoSize)size atIndex:(NSUInteger)index {
    NSString *path = [NSBundle.mainBundle URLForResource:images[index] withExtension:nil].path;
    return path;
}

- (bool)photoGallery:(IRGalleryViewController*)gallery isFavoriteForPhotoAtIndex:(NSUInteger)index{
    return NO;
}

- (void)photoGallery:(IRGalleryViewController*)gallery addFavorite:(bool)isAddToFavortieList atIndex:(NSUInteger)index{
    // mark favortie
}


@end
