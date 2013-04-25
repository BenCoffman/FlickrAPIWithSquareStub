//
//  ImageVals.m
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import "ImageVals.h"

@implementation ImageVals
-(id)initWithValue:(NSString *)title imageURL:(NSString *)imageURL{
    if(self = [super init]){
        self.title = title;
        self.imageURL = imageURL;
    }
    
    return self;
}

@end
