//
//  MapView.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)displayMap
{
	MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.05;
    span.longitudeDelta=0.05;
	
    region.span=span;
    region.center=self.mapAnnotation.coordinate;
        
    [self addAnnotation:self.mapAnnotation];
    [self setRegion:region animated:YES];
    //[self regionThatFits:region];
    self.mapType = MKMapTypeStandard;
          
    MKMapRect flyTo = MKMapRectNull;
    MKMapPoint annotationPoint = MKMapPointForCoordinate(self.mapAnnotation.coordinate);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
    
    if (MKMapRectIsNull(flyTo)) {
        flyTo = pointRect;
    } else {
        flyTo = MKMapRectUnion(flyTo, pointRect);
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *identifier = @"mapAnnotation";
    
    if ([annotation isKindOfClass:[MapAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        
        return annotationView;
    }
    return nil;
}


@end
