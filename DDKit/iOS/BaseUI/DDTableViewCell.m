//
//  DDTableViewCell.m
//  Pods
//
//  Created by amoblin on 16/8/25.
//
//

#import "DDTableViewCell.h"

@implementation DDTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupSubviews];
        [self configConstraints];
    }
    return self;
}

- (void)setupSubviews;
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.titleLabel = [UILabel labelWithFont:DDSystemFontSize14 textColor:[UIColor blackColor]];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
}

- (void)configConstraints;
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)configCell;
{
}

@end
