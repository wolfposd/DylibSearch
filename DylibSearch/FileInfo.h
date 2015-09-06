//
//  FileInfo.h
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import <Foundation/Foundation.h>


#define INFECTED_CHECK_UNKNOWN 0
#define INFECTED_CHECK_SAFE 1
#define INFECTED_CHECK_INFECTED 2


@interface FileInfo : NSObject

@property (nonatomic,retain) NSString* fileName;
@property (nonatomic,retain) NSString* infectionString;
@property (nonatomic) int infected;

/**
 *  Creates a fileinfo object
 *
 *  @param name      name of this file
 *  @param infString the infection detail, or empty string
 *  @param infected  PENDING, SAFE or INFECTED
 *
 *  @return obj
 */
+(FileInfo*) info:(NSString*) name infectionString:(NSString*) infString infected:(int) infected;

@end
