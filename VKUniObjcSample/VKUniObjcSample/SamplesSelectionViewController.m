//
//  SamplesSelectionViewController.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "SamplesSelectionViewController.h"
#import "SampleDescriptor.h"
#import "SampleViewControllers.h"
#import "ObjCCollectionsViewController.h"
#import "VKUniObjcSample-Swift.h"


@interface SamplesSelectionViewController ()

@property (nonatomic, copy) NSArray<id<SampleDescriptor>> *samples;

@end

@implementation SamplesSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.samples = @[
        [ObjCPPSamplesViewController descriptor],
        [PIMPLSampleViewController descriptor],
        [ObjCCollectionsViewController descriptor],
    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.samples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SampleDescriptor> descriptor = self.samples[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SampleCellID" forIndexPath:indexPath];
    cell.textLabel.text = descriptor.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:self.samples[indexPath.row].storyboardID];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
