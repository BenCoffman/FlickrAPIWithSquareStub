//
//  BCViewController.m
//  FlickrAPIwSquareStub
//
//  Created by Coffman, Ben on 4/15/13.
//  Copyright (c) 2013 Coffman, Ben. All rights reserved.
//

#import "BCViewController.h"
#import "Cell.h"
#import "UIImageView+AFNetworking.h"
#import "FlickrPhotoAPI.h"
#import "ImageVals.h"


// CollectionView Stuff
NSString *kCellID       = @"cellID";

// Flickr stuff
NSString *kBaseURL      = @"http://api.flickr.com/services/rest/?";//
NSString *kFlickrMethod = @"flickr.people.getPublicPhotos";
NSString *kFlickrAPIKey = @"b027355a43e1614b9b409da30834c285";
NSString *kUserID       = @"77759596%40N00";
NSString *kExtras       = @"url_m";
NSString *kPerPage      = @"6";
NSString *kNumOfPages   = @"1";
NSString *kFormat       = @"json";


@interface BCViewController (){
    NSMutableArray *_aryImageInfo;
    BOOL _dataArrived;
}

@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _aryImageInfo = [[NSMutableArray alloc] init];
    
    
    NSString *flickrURL = [NSString stringWithFormat:@"%@method=%@&api_key=%@&user_id=%@&extras=%@&per_page=%@&page=%@&format=%@&nojsoncallback=1", kBaseURL,kFlickrMethod, kFlickrAPIKey, kUserID, kExtras, kPerPage, kNumOfPages,kFormat];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:flickrURL]];

    [[FlickrPhotoAPI sharedInstance] getListOfImages:urlRequest
                                         completion:^(id result) {
                                             [[[result objectForKey:@"photos"] objectForKey:@"photo"] enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) {
                                                 
                                                 // create a model with link and title in it
                                                 // push it into array.
                                                 ImageVals *imageVals = [[ImageVals alloc] initWithValue:[obj objectForKey:@"title"] imageURL:[obj objectForKey:@"url_m"]];
                                                 
                                                 [_aryImageInfo addObject:imageVals];
                                             }];
                                             
                                             _dataArrived = true;
                                             [self.collectionView reloadData];
                                         }
                                         failure:^(NSError *error) {
                                             NSLog(@"My Error: %@", error);
                                         }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Collection View
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // NOTE: If you are getting this dynamically from the internet you would never hard code it, but for this example
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_dataArrived == false) {
        Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
        
        cell.lblTitle.text = @"loading...";
        //cell.ivImage.image = [UIImage imageNamed:@"Placeholder"];
        
        return cell;
    }
    else{
        Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];

        ImageVals *imageInfo = [_aryImageInfo objectAtIndex:indexPath.item];

        cell.lblTitle.text = imageInfo.title;

        [cell.ivImage setImageWithURL:[NSURL URLWithString:imageInfo.imageURL]];

        return cell;
    } 
}

@end
