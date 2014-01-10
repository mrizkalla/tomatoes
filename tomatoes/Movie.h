//
//  Movie.h
//  tomatoes
//
//  Created by Michael Rizkalla on 1/7/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *thumbnail_url;

-(id) initWithDictionary:(NSDictionary*) dictionary;

@end
