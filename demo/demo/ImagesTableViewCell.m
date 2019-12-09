//
//  ImagesTableViewCell.m
//  demo
//
//  Created by Phil on 2019/11/20.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "ImagesTableViewCell.h"

@implementation ImagesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)identifier{
    return NSStringFromClass([self class]);
}

@end
