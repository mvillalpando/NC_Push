//
//  DestinationDetails.m
//  Navigation Controller
//
//  Created by Mariela Villalpando on 7/1/16.
//  Copyright © 2016 OG. All rights reserved.
//

#import "DestinationDetails.h"
//#import "Description.h"

@interface DestinationDetails()
@property NSMutableArray *dTitles;
@property NSMutableArray *dDescriptions;
@property NSMutableArray *dPhotos;

@property NSString *stTitleSelected;
@property NSString *stDescriptionSelected;
@property NSString *stPhotoSelected;

@end
@implementation DestinationDetails

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.dTitles   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"San Sebastian del Oeste", @"Zapopan", @"Tequila", @"Tapalpa", nil];
     self.dPhotos   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara.png", @"SanSebastian.png", @"Zapopan.jpg", @"Tequila.png", @"Tapalpa.png", nil];
     self.dDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Se localiza en el occidente de México, al centro de Jalisco, en la zona geográfica conocida como Valle de Atemajac. ", @" Se localiza al oeste del estado, en la Región Sierra Occidental. Su extensión territorial es de 1400,13 km2", @"Se localiza en la región centro del estado, en la macro región del Bajío Occidente o Centro Occidente de México", @"El municipio de Tequila está situado en diferentes relieves, tiene pocas tierras planas, a excepción de algunos pequeños valles, su orografía es muy irregular.", @"Tapalpa es un municipio y población del estado de Jalisco, México. Se localiza en la Región Sur, aproximadamente a 118 kilómetros de Guadalajara", nil];
    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
/*-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}*/
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellDestinations *cell = (cellDestinations *)[tableView dequeueReusableCellWithIdentifier:@"cellDestinations"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellDestinations" bundle:nil] forCellReuseIdentifier:@"cellDestinations"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellDestinations"];
    }
    //Fill cell with info from arrays
    cell.lblCity.text = self.dTitles[indexPath.row];
    cell.lblDescription.text = self.dDescriptions[indexPath.row];
    cell.imgDestinations.image = [UIImage imageNamed:self.dPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stTitleSelected        = self.dTitles[indexPath.row];
    self.stDescriptionSelected  = self.dDescriptions[indexPath.row];
    self.stPhotoSelected        = self.dPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"Description" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[DescriptionCity class]]) {
        DescriptionCity *destination     = [segue destinationViewController];
        destination.dTitles        = self.stTitleSelected;
        destination.dDescriptions  = self.stDescriptionSelected;
        destination.dPhotos        = self.stPhotoSelected;
        
    }
}

@end
