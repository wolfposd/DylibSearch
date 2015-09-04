//
//  FileInfo.h
//  DylibSearch
//
//  Created by Mordredd666 on 04.09.15.
//  Copyright (c) 2015 Mordredd666. All rights reserved.
//

#import <Foundation/Foundation.h>


#define INFECTED_CHECK_PENDING 0
#define INFECTED_CHECK_SAFE 1
#define INFECTED_CHECK_INFECTED 2


@interface FileInfo : NSObject

@property (nonatomic,retain) NSString* fileName;
@property (nonatomic,retain) NSString* filePath;
@property (nonatomic) int infected;


+(FileInfo*) info:(NSString*) name path:(NSString*) path infected:(int) infected;

@end
