//
//  ViewController.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "DropBoxUserVC.h"
#import "DropBoxUserView.h"
#import "MapView.h"
#import "XMLParser.h"
#import "MBProgressHUD+Utils.h"

#define LOADING @"Loading"

@interface DropBoxUserVC ()

@end

@implementation DropBoxUserVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view mode:MBProgressHUDModeIndeterminate label:LOADING detailsLabel:nil];
    __block DropBoxUserObject *duo;
    MapView *mapView = [[MapView alloc]initWithFrame:CGRectMake(10, 50, 300, 180)];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableArray *entries = [XMLParser grabRSSFeed:URL_BLOG];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            duo = [[DropBoxUserObject alloc]initWithData:[entries objectAtIndex:0]];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            DropBoxUserView *dbUserView = [[DropBoxUserView alloc]initWithDropBoxUserObject:duo];
            MapAnnotation *mapAnnotation = [[MapAnnotation alloc]init];
            
            CLLocationCoordinate2D location;
            location.latitude = duo.latitude;
            location.longitude = duo.longitude;
            mapAnnotation.coordinate = location;
            mapAnnotation.title = duo.name;
            mapView.mapAnnotation = mapAnnotation;
            [self.view addSubview:dbUserView];
            [self.view addSubview:mapView];
            [mapView displayMap];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
