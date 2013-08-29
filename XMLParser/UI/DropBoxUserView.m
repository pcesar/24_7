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
        
        self.nameLabel.text = duo.name;
        self.categoryLabel.text = [NSString stringWithFormat:@"(%@)",duo.category];
        self.ratingImageView.frame = CGRectMake(310 - (IMAGE_SIZE * duo.rating), 10, IMAGE_SIZE * duo.rating, IMAGE_SIZE);
        for (int i = 0; i < duo.rating ; i++) {
            UIImageView *star = [[UIImageView alloc]initWithFrame:CGRectMake(i*IMAGE_SIZE, 0, IMAGE_SIZE, IMAGE_SIZE)];
            star.image = IMAGE_STAR;
            [self.ratingImageView addSubview:star];
        }
        
        self.mapView = [[MapView alloc]initWithFrame:CGRectMake(10, 50, 300, 180)];
        MapAnnotation *mapAnnotation = [[MapAnnotation alloc]init];
        
        CLLocationCoordinate2D location;
        location.latitude = duo.latitude;
        location.longitude = duo.longitude;
        
        mapAnnotation.coordinate = location;
        mapAnnotation.title = duo.name;
        self.mapView.mapAnnotation = mapAnnotation;
        
        [self customizeSubviews];
    
        [self addSubview:self.nameLabel];
        [self addSubview:self.categoryLabel];
        [self addSubview:self.ratingImageView];
        [self addSubview:self.mapView];
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
    self.categoryLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
    self.categoryLabel.textColor = [UIColor darkGrayColor];
    self.categoryLabel.backgroundColor = [UIColor clearColor];
}

@end
