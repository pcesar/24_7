//
//  DropBoxUserObject.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "DropBoxUserObject.h"

@implementation DropBoxUserObject

- (DropBoxUserObject *)initWithData:(NSDictionary *)data
{
    DropBoxUserObject *duo = [[DropBoxUserObject alloc]init];
    duo.name = [data objectForKey:kName];
    duo.category = [data objectForKey:kCategory];
    duo.rating = [[data objectForKey:kRating] intValue];
    duo.address = [data objectForKey:kAddress];
    duo.city = [data objectForKey:kCity];
    duo.state = [data objectForKey:kState];
    duo.zip = [data objectForKey:kZip];
    duo.latitude = [[data objectForKey:kLatitude] floatValue];
    duo.longitude = [[data objectForKey:kLongitude] floatValue];
    duo.phone = [data objectForKey:kPhone];
    
    return duo;
}

@end
