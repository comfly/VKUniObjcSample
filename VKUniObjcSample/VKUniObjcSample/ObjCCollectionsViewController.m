//
//  ObjCCollectionsViewController.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "ObjCCollectionsViewController.h"
#import "SampleDescriptor.h"
#import "ObjCCollectionsDataSource.h"
#import "CollectionsSampleItem.h"


@interface ObjCCollectionsViewController ()

@property (nonatomic) ObjCCollectionsDataSource *dataSource;

@end


@implementation ObjCCollectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[ObjCCollectionsDataSource alloc] init];
}

+ (id<SampleDescriptor>)descriptor {
    return [SampleDescriptor descriptorWithTitle:@"Obj-C Collections sample" storyboardID:NSStringFromClass(self)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionsCellID" forIndexPath:indexPath];
    CollectionsSampleItem *item = self.dataSource[indexPath];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.details;
    
    return cell;
}

@end
