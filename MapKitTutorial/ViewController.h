//
//  ViewController.h
//  MapKitTutorial
//
//  Created by hssh on 2014/06/24.
//  Copyright (c) 2014年 hssh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *mapSearchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
