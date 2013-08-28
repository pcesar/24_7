//
//  XMLParser.m
//  XMLParser
//
//  Created by Patricia Cesar on 8/29/13.
//  Copyright (c) 2013 Patricia Cesar. All rights reserved.
//

#import "XMLParser.h"
#import "TouchXML.h"

@implementation XMLParser

+ (NSMutableArray *)grabRSSFeed:(NSString *)blogAddress
{
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:blogAddress];
    CXMLDocument *rssParser = [[CXMLDocument alloc] initWithContentsOfURL:url options:0 error:nil];
    NSArray *resultNodes = NULL;
    resultNodes = [rssParser nodesForXPath:[NSString stringWithFormat:@"/%@", kBusiness] error:nil];
    
    for (CXMLElement *resultElement in resultNodes) {
        NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
        int counter;
        
        for(counter = 0; counter < [resultElement childCount]; counter++) {
            if([[[resultElement childAtIndex:counter] name] isEqualToString:kLocation]){
                resultNodes = [rssParser nodesForXPath:[NSString stringWithFormat:@"//%@", kLocation] error:nil];
                NSDictionary *location = [self getElementsInArray:resultNodes];
                [blogItem addEntriesFromDictionary:location];
            }
            else {
                [blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
            }
        }
        [entries addObject:[blogItem copy]];
    }
    return entries;
}
/*
 source : http://dblog.com.au/general/iphone-sdk-tutorial-building-an-advanced-rss-reader-using-touchxml-part-1/
 */

+ (NSDictionary *)getElementsInArray:(NSArray *)resultNodes
{
    NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
    for (CXMLElement *resultElement in resultNodes) {
        
        int counter;
        
        for(counter = 0; counter < [resultElement childCount]; counter++) {
            
            [blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
        }
    }
    return blogItem;
}
@end
