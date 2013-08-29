//
//  DropBoxUserView.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "DropBoxUserView.h"

#define IMAGE_SIZE 20

@interface DropBoxUserView ()

@property (strong, nonatomic) UILabel *categoryLabel;
@property (strong, nonatomic) UIImageView *ratingImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *phoneNumberLabel;
@property (strong, nonatomic) UILabel *contactInfo;

@end

@implementation DropBoxUserView

- (id)initWithDropBoxUserObject:(DropBoxUserObject *)duo
{
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        
        if(!self.nameLabel) self.nameLabel = [[UILabel alloc]init];
        if(!self.categoryLabel) self.categoryLabel = [[UILabel alloc]init];
        if(!self.ratingImageView) self.ratingImageView = [[UIImageView alloc]init];
        if(!self.contactInfo) self.contactInfo = [[UILabel alloc]init];
        if(!self.phoneNumberLabel) self.phoneNumberLabel = [[UILabel alloc]init];
        if(!self.addressLabel) self.addressLabel = [[UILabel alloc]init];
        
        self.nameLabel.text = duo.name;
        self.categoryLabel.text = [NSString stringWithFormat:@"(%@)",duo.category];
        self.ratingImageView.frame = CGRectMake(310 - (IMAGE_SIZE * duo.rating), 10, IMAGE_SIZE * duo.rating, IMAGE_SIZE);
        for (int i = 0; i < duo.rating ; i++) {
            UIImageView *star = [[UIImageView alloc]initWithFrame:CGRectMake(i*IMAGE_SIZE, 0, IMAGE_SIZE, IMAGE_SIZE)];
            star.image = IMAGE_STAR;
            [self.ratingImageView addSubview:star];
        }
        self.contactInfo.text = @"Contact Information : ";
        self.phoneNumberLabel.text = duo.phone;
        self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@, %@\n%@", duo.address, duo.city, duo.state, duo.zip];
        
        [self customizeSubviews];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.categoryLabel];
        [self addSubview:self.ratingImageView];
        [self addSubview:self.contactInfo];
        [self addSubview:self.phoneNumberLabel];
        [self addSubview:self.addressLabel];
        
    }
    return self;
}

- (void)customizeSubviews
{
    self.nameLabel.frame = CGRectMake(10, 5, 160, 25);
    self.nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0f];
    self.nameLabel.textColor = [UIColor darkGrayColor];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    
    self.categoryLabel.frame = CGRectMake(10, 25, 160, 20);
    self.categoryLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0f];
    self.categoryLabel.textColor = [UIColor darkGrayColor];
    self.categoryLabel.backgroundColor = [UIColor clearColor];
    
    self.contactInfo.frame = CGRectMake(10, 240, 300, 20);
    self.contactInfo.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
    self.contactInfo.textColor = [UIColor darkGrayColor];
    self.contactInfo.backgroundColor = [UIColor clearColor];
    
    self.phoneNumberLabel.frame = CGRectMake(10, 265, 300, 20);
    self.phoneNumberLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0f];
    self.phoneNumberLabel.textColor = [UIColor darkGrayColor];
    self.phoneNumberLabel.backgroundColor = [UIColor clearColor];
    
    self.addressLabel.frame = CGRectMake(10, 290, 300, 100);
    self.addressLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0f];
    self.addressLabel.textColor = [UIColor darkGrayColor];
    self.addressLabel.backgroundColor = [UIColor clearColor];
    self.addressLabel.numberOfLines = 0;
    [self.addressLabel sizeToFit];
}

@end
