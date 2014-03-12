//
//  FlickrPhotoAPI.m
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import "FlickrPhotoAPI.h"
#import "AFJSONRequestOperation.h"

@implementation FlickrPhotoAPI

+(FlickrPhotoAPI *)sharedInstance{
    
    static FlickrPhotoAPI *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FlickrPhotoAPI alloc] init];
    });
    
    return instance;
}

-(void)getListOfImages:(NSURLRequest *)urlRequest completion:(FlickrAPICompletionBlk)flickrAPIComletionBlk failure:(FlickrAPIFailureBlk)flickrAPIFailureBlk{
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                            NSLog(@"%@", JSON);
                                                                                            flickrAPIComletionBlk(JSON);
                                                                                        }
                                                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                            flickrAPIFailureBlk(error);
                                                                                        }];
    [operation start];
}

@end
