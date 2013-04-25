//
//  FlickAPI.m
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import "FlickrAPI.h"

@implementation FlickAPI

+(FlickrAPI *)sharedInstance{
    
    static FlickrAPI *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FlickrAPI alloc] init];
    });
    
    return instance;
}

@end
