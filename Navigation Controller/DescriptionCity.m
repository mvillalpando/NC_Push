//
//  Description.m
//  Navigation Controller
//
//  Created by Mariela Villalpando on 7/1/16.
//  Copyright © 2016 OG. All rights reserved.
//

#import "DescriptionCity.h"

@interface DescriptionCity ()

@end

@implementation DescriptionCity

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblCity.text          = self.dTitles;
    self.lblDescription.text    = self.dDescriptions;
    self.imgDescription.image   = [UIImage imageNamed:self.dPhotos];
    
    self.lblDescription.numberOfLines = 0;
    [self.lblDescription sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
