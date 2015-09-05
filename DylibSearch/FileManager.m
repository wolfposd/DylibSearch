//
//  FileManager.m
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import "FileManager.h"

#import "FileInfo.h"

@implementation FileManager


+(NSArray*) findKeyWords
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"search"
                                                     ofType:@"txt"];
    
    NSError* error = nil;
    NSString* keywords = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"%@", error.description);
    }
    
    NSArray *listItems = [keywords componentsSeparatedByString:@"\n"];
    return listItems;
}



+(NSMutableArray*) findFiles
{
    NSArray* keyWords = [self findKeyWords];
    
    NSMutableArray* result = [NSMutableArray new];
    
    
    NSString* dir = @"/Library/MobileSubstrate/DynamicLibraries/";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSError *error;
    NSArray *items = [manager contentsOfDirectoryAtPath:dir error:&error];
    
    if (!error)
    {
        for (NSString *item in items)
        {
            if([item rangeOfString:@".dylib"].location != NSNotFound)
            {
                NSString* itemPath = [dir stringByAppendingString:item];
                
                NSData* contents = [NSData dataWithContentsOfFile:itemPath];
                
                
                BOOL infected = NO;
                NSString* infection = @"";
                
                for (NSString* singleKeyWord in keyWords)
                {
                    NSRange range =  [contents rangeOfData:[singleKeyWord dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions range:NSMakeRange(0,[contents length])];
                    
                    if(range.location != NSNotFound)
                    {
                        infected = YES;
                        infection = singleKeyWord;
                        break;
                    }
                }
                
                FileInfo* inf = [FileInfo info:item infectionString:infection infected:infected ? INFECTED_CHECK_INFECTED : INFECTED_CHECK_SAFE];
                
                
                [result addObject:inf];
            } 
        }
    }
    
    return result;
}


@end
