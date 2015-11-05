//
//  AppScanner.m
//  DylibSearch
//
//  Created by wolf on 05.11.15.
//  Copyright © 2015 posdorfer. All rights reserved.
//

#import "Sysout.h"
#import "AppScanner.h"
#include <stdio.h>
#import <dlfcn.h>
#import <objc/runtime.h>

//@interface LSApplicationProxy : NSObject
//{
//    unsigned int _flags;
//    unsigned int _bundleFlags;
//    NSArray *_privateDocumentIconNames;
//    LSApplicationProxy *_privateDocumentTypeOwner;
//    NSArray *_directionsModes;
//    NSArray *_UIBackgroundModes;
//    NSArray *_audioComponents;
//    BOOL _profileValidated;
//    BOOL _isPlaceholder;
//    BOOL _isAppUpdate;
//    BOOL _isNewsstandApp;
//    BOOL _isRestricted;
//    BOOL _foundBackingBundle;
//    NSString *_applicationType;
//    NSString *_signerIdentity;
//    NSDictionary *_entitlements;
//    NSDictionary *_environmentVariables;
//    NSArray *_machOUUIDs;
//    NSString *_vendorID;
//    NSString *_vendorName;
//    NSString *_bundleVersion;
//    NSString *_shortVersionString;
//    NSDictionary* _groupContainers;
//    NSURL *_bundleURL;
//    unsigned int _installType;
//}
//@end

@interface LSApplicationProxy : NSObject
{
    NSNumber *_ODRDiskUsage;
    NSArray *_UIBackgroundModes;
    NSArray *_VPNPlugins;
    NSArray *_appTags;
    NSString *_applicationDSID;
    NSString *_applicationVariant;
    NSArray *_audioComponents;
    NSString *_companionAppIdentifier;
    NSArray *_deviceFamily;
    NSUUID *_deviceIdentifierForVendor;
    NSArray *_directionsModes;
    NSNumber *_downloaderDSID;
    NSNumber *_dynamicDiskUsage;
    NSArray *_externalAccessoryProtocols;
    NSNumber *_familyID;
    unsigned int _flags;
    NSDictionary *_groupContainers;
    NSArray *_groupIdentifiers;
    unsigned int _installType;
    BOOL _isContainerized;
    NSNumber *_itemID;
    NSString *_itemName;
    NSString *_minimumSystemVersion;
    long _modTime;
    unsigned int _originalInstallType;
    NSArray *_plugInKitPlugins;
    NSArray *_pluginUUIDs;
    NSArray *_privateDocumentIconNames;
    LSApplicationProxy *_privateDocumentTypeOwner;
    NSNumber *_purchaserDSID;
    long _regTime;
    NSDate *_registeredDate;
    NSArray *_requiredDeviceCapabilities;
    NSString *_sdkVersion;
    NSString *_shortVersionString;
    NSString *_sourceAppIdentifier;
    NSNumber *_staticDiskUsage;
    NSString *_storeCohortMetadata;
    NSNumber *_storeFront;
    NSString *_teamID;
    NSString *_vendorName;
    NSNumber *_versionID;
}

@end



@implementation AppScanner




+(void) startScanning
{
    void *IOKit = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices",RTLD_NOW);//Make Sure We Have What We Need.Gotta Check That
    Class LSApplicationWorkspace = objc_getClass("LSApplicationWorkspace");
    id WorkSpace=[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)];
    
    NSArray* ListOfApps=[WorkSpace performSelector:@selector(allApplications)];
    
    [Sysout println:ListOfApps.description];
    
    for(id prox in ListOfApps)
    {
       // Ivar ivar = class_getInstanceVariable( objc_getClass("LSApplicationProxy"), "_groupContainers");
        
        [self checkIvars:prox];
        break;
    }
    
    
    
    
    
//    for(int i = 0 ; i <= ListOfApps.count ; i++)
//    {
//        LSApplicationProxy* object=[ListOfApps objectAtIndex:i];
//        Ivar ivar = class_getInstanceVariable( objc_getClass("LSApplicationWorkspace"), "_bundleURL");
//        NSURL* url=object_getIvar(object,ivar);
//        NSString* URLSTR=[url absoluteString];
//        
//        NSDictionary* InfoDict=[NSDictionary dictionaryWithContentsOfFile:[URLSTR stringByAppendingString:@"/Info.plist"]];
//        
//        
//        NSString* executable = [InfoDict objectForKey:@"CFBundleExecutable"];
//        
//        NSString* absolutePath = [NSString stringWithFormat:@"%@/%@", URLSTR, executable];
//        
//        NSLog(@"%@", absolutePath);
//        
//        
//        //NSString* BashCommand=[NSString stringWithFormat:@"DYLD_INSERT_LIBRARIES=/usr/lib/XcodeGhostScanner.dylib %@/%@",URLSTR,];
//        
//        //system([BashCommand UTF8String]);
//        
//    }
    
    dlclose(IOKit);
    
}


+(void) checkIvars:(id) someObject
{
    unsigned int varCount;
    
    Ivar *vars = class_copyIvarList([someObject class], &varCount);
    
    for (int i = 0; i < varCount; i++) {
        Ivar var = vars[i];
        
        const char* name = ivar_getName(var);
        const char* typeEncoding = ivar_getTypeEncoding(var);
        
        // do what you wish with the name and type here
        
        [Sysout println:[NSString stringWithFormat:@"%s %s", name, typeEncoding]];
        
        NSString* sName = [NSString stringWithFormat:@"%s",name];
        
        [Sysout println:[NSString stringWithFormat:@"%@: %@",sName, [someObject valueForKey:sName]]];
        
    }
    
    free(vars);
}



@end
