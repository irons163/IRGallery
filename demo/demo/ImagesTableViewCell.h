//
//  ImagesTableViewCell.h
//  demo
//
//  Created by Phil on 2019/11/20.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (NSString*)identifier;

@end

NS_ASSUME_NONNULL_END
