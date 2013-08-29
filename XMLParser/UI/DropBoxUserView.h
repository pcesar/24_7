//
//  DropBoxUserView.h
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "DropBoxUserObject.h"
#import "MapView.h"
#import "MapAnnotation.h"

@interface DropBoxUserView : UIView

@property (strong, nonatomic) MapView *mapView;

- (id)initWithDropBoxUserObject:(DropBoxUserObject *)duo;

@end
