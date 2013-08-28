//
//  MBProgressHUD+Utils.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "MBProgressHUD+Utils.h"

@implementation MBProgressHUD (Utils)

+ (MBProgressHUD *)showHUDAddedTo:(id)sender mode:(MBProgressHUDMode)mode label:(NSString *)label detailsLabel:(NSString *)detailsLabel
{
    [MBProgressHUD hideAllHUDsForView:sender animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:sender animated:YES];
    hud.mode = mode;
    hud.labelText = label;
    hud.detailsLabelText = detailsLabel;
	hud.dimBackground = YES;
    
    return hud;
}

@end
