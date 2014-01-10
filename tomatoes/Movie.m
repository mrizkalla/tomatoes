//
//  Movie.m
//  tomatoes
//
//  Created by Michael Rizkalla on 1/7/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "Movie.h"

@implementation Movie


- (id) initWithDictionary:(NSDictionary *) dictionary {
    
    self.title = [dictionary objectForKey:@"title"];
    self.synopsis = [dictionary objectForKey:@"synopsis"];
    
    NSDictionary *posters = [dictionary objectForKey:@"posters"];
    self.thumbnail_url = [posters objectForKey:@"thumbnail"];
    
    return self;
}

@end
