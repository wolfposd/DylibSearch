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


+(NSDictionary*) findKeyWords
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"search" ofType:@"txt"];
    
    NSError* error = nil;
    NSData* keywords = [NSData dataWithContentsOfFile:path];
    
    if(error)
    {
        NSLog(@"%@", error.description); // this shouldnt happen...
    }
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:keywords options:kNilOptions error:&error];
    
    return dict;
}



+(NSMutableArray*) findFiles
{
    NSDictionary* keyWords = [self findKeyWords];
    
    NSMutableArray* result = [NSMutableArray new];
    
    
    NSString* dir = @"/Library/MobileSubstrate/DynamicLibraries/";
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSError *error;
    NSArray *items = [manager contentsOfDirectoryAtPath:dir error:&error];
    
    if (!error)
    {
        for (NSString *item in items)
        {
            if([item rangeOfString:@".dylib"].location != NSNotFound) // only scan dylib files
            {
                NSString* itemPath = [dir stringByAppendingString:item];
                
                NSData* contents = [NSData dataWithContentsOfFile:itemPath];
                
                
                // Some tweaks leave symlinks behind that do not point to a file anymore, output "unknown" for now
                if(!contents || contents.length == 0)
                {
                    FileInfo* inf = [FileInfo info:item infectionString:@"Unknown" infected:INFECTED_CHECK_UNKNOWN];
                    [result addObject:inf];
                }
                else // the file actually contains data, start to scan
                {
                    BOOL infected = NO;
                    NSString* infection = @"";
                    
                    // use the dictionary-keys as search keys
                    // values are the name of malware/adware
                    for (NSString* singleKeyWord in keyWords) // check every keyword from search.txt
                    {
                        NSRange range =  [contents rangeOfData:[singleKeyWord dataUsingEncoding:NSUTF8StringEncoding]
                                                       options:kNilOptions range:NSMakeRange(0,[contents length])];
                        
                        if(range.location != NSNotFound)
                        {
                            infected = YES;
                            infection = keyWords[singleKeyWord];
                            break;
                        }
                    }
                    
                    FileInfo* inf = [FileInfo info:item infectionString:infection
                                          infected:infected ? INFECTED_CHECK_INFECTED : INFECTED_CHECK_SAFE];
                    
                    
                    [result addObject:inf];
                }
                
            }
        }
    }
    
    return result;
}


@end
