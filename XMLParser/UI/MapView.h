//
//  MapView.h
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface MapView : MKMapView <MKMapViewDelegate>

@property (strong, nonatomic) MapAnnotation *mapAnnotation;

- (void)displayMap;

@end
