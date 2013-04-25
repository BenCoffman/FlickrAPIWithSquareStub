//
//  MImage.m
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/22/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import "MImage.h"

@implementation MImage

-(id)initWithValues:(NSString *)imageName imageURL:(NSString *)imageURL{
    if(self = [super init]){
        self.imageName = imageName;
        self.imageURL = imageURL;
    }
    
    return self;
}

@end
