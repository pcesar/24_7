//
//  MBProgressHUD+Utils.h
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Utils)

+ (MBProgressHUD *)showHUDAddedTo:(id)sender mode:(MBProgressHUDMode)mode label:(NSString *)label detailsLabel:(NSString *)detailsLabel;

@end
