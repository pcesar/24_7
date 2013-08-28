//
//  NSDate+Converter.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "NSDate+Converter.h"

@implementation NSDate (Converter)

- (NSString *)convertToString
{
    if(!self) return @"";
    NSDateFormatter *formattedDate = [[NSDateFormatter alloc]init];
    [formattedDate setDateFormat:@"MMM d, h:mm a"];
    return [formattedDate stringFromDate:[NSDate date]];
}

@end
