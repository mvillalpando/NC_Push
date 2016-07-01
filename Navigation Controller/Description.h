//
//  Description.h
//  Navigation Controller
//
//  Created by Mariela Villalpando on 7/1/16.
//  Copyright © 2016 OG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Description : UIViewController
@property NSMutableArray *dTitles;
@property NSMutableArray *dDescriptions;
@property NSMutableArray *dPhotos;

@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UILabel *lblCity;
@property (strong, nonatomic) IBOutlet UIImageView *imgDescription;

@end
