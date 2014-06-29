//
//  ViewController.m
//  MapKitTutorial
//
//  Created by hssh on 2014/06/24.
//  Copyright (c) 2014年 hssh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapSearchBar.delegate = self;
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mapSearchBar resignFirstResponder];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:self.mapSearchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        CLLocationCoordinate2D newLocation = [placemark.location coordinate];

        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:newLocation];
        [self.mapView addAnnotation:annotation];
        
        MKMapRect mr = [self.mapView visibleMapRect];
        MKMapPoint pt = MKMapPointForCoordinate([annotation coordinate]);
        mr.origin.x = pt.x - mr.size.width * 0.5;
        mr.origin.y = pt.y - mr.size.height * 0.25;
        [self.mapView setVisibleMapRect:mr animated:YES];
    }];
}

@end
