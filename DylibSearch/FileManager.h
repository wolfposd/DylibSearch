//
//  FileManager.h
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

/**
 * Returns the list of keywords to loook for in files
 */
+(NSDictionary*) findKeyWords;

/** 
 * Returns a list of FileInfo-objects. These objects have been scanned for known Strings
 */
+(NSMutableArray*) findFiles;

@end
