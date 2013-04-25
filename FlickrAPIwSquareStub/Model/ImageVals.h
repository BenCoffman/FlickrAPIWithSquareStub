//
//  ImageVals.h
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageVals : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;

-(id)initWithValue:(NSString *)title imageURL:(NSString *)imageURL;
@end
