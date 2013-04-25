//
//  FlickrPhotoAPI.h
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FlickrAPICompletionBlk)(id result);
typedef void (^FlickrAPIFailureBlk)(NSError *error);

@interface FlickrPhotoAPI : NSObject

+(FlickrPhotoAPI *)sharedInstance;

-(void)getListOfImages:(NSURLRequest *)urlRequest completion:(FlickrAPICompletionBlk)flickrAPIComletionBlk failure:(FlickrAPIFailureBlk)flickrAPIFailureBlk;

@end
