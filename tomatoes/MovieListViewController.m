//
//  MovieListViewController.m
//  tomatoes
//
//  Created by Michael Rizkalla on 1/7/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "MovieListViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSMutableArray *movies;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.movies = [[NSMutableArray alloc] init];

        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
            completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                for(NSDictionary *movie in [object valueForKeyPath:@"movies"]) {
                    Movie *obj = [[Movie alloc] initWithDictionary:movie];
                    [self.movies addObject:obj];
                }
                NSLog(@"%@", object);
                [self.tableView reloadData];
            }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    cell.titleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    [cell.thumbImageView setImageWithURL:[NSURL URLWithString:movie.thumbnail_url]];
    
    return cell;
}



@end
