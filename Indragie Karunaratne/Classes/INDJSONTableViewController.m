//
//  INDJSONTableViewController.m
//  Indragie Karunaratne
//
//  Created by Indragie Karunaratne on 2014-04-07.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

#import "INDJSONTableViewController.h"
#import "INDJSONModelAdapter.h"
#import "NSJSONSerialization+INDAdditions.h"

@interface INDJSONTableViewController ()
@property (nonatomic, strong, readwrite) NSArray *objects;
@end

@implementation INDJSONTableViewController

#pragma mark - Initialization

- (void)reloadDataWithJSONFileName:(NSString *)fileName
{
	NSError *error = nil;
	NSArray *JSONArray = [NSJSONSerialization ind_deserializeJSONObjectFromContentsOfFileName:fileName error:&error];
	if (JSONArray == nil) {
		NSLog(@"Error deserializing JSON: %@", error);
		return;
	}
	
	self.objects = [INDJSONModelAdapter modelObjectsFromJSONArray:JSONArray];
}

#pragma mark - MNSDataMediatorDelegate

- (NSArray *)sections
{
	return @[[MNSSection sectionWithObjects:self.objects]];
}

@end
