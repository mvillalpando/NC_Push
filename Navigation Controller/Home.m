//
//  ViewController.m
//  Navigation Controller
//
//  Created by Mariela Villalpando on 6/30/16.
//  Copyright © 2016 OG. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;

@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view, typically from a nib.
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    self.destinationTitles   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"San Sebastian del Oeste", @"Tapalpa", @"Tequila", @"Vallarta", nil];
    self.destinationPhotos   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara.png", @"SanSebastian.png", @"Tapalpa.png", @"Tequila.png", @"Vallarta.png", nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.destinationTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    
    cell.lblDestination.text = self.destinationTitles[indexPath.row];
    cell.imgDestination.image = [UIImage imageNamed:self.destinationPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self performSegueWithIdentifier:@"DestinationDetails" sender:self];
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
   // if ([segue.destinationViewController isKindOfClass:[DestinationDetails class]]) {
    //    DestinationDetails *destination     = [segue destinationViewController];
      //  destination.destinationTitle        = self.stTitleSelected;
        //destination.destinationDescription  = self.stDescriptionSelected;
        //destination.destinationPhoto        = self.stPhotoSelected;
        
    //}
}


@end
