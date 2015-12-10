//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "BlockSampleViewController.h"
#import "SampleDescriptor.h"
#import "BlockExtensions.h"
#import "List.h"


@interface BlockSampleViewController ()

@property (nonatomic, copy) List list;

@end

@implementation BlockSampleViewController

+ (id<SampleDescriptor>)descriptor {
    return [SampleDescriptor descriptorWithTitle:@"Blocks sample" storyboardID:NSStringFromClass(self)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    Transform f = [[^(NSString *s) {
        return [@"Line " stringByAppendingString:s];
    }  compose:^(NSNumber *n) {
        return [n descriptionWithLocale:nil];
    }] compose:^(NSNumber *n) {
        return @(n.unsignedIntValue * 10);
    }];

    self.list = map(list(@1, @2, @3, @4, nil), f);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(calculateSum)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4; // count(self.list);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlockSampleCellID" forIndexPath:indexPath];
    NSNumber *item = nth(self.list, (unsigned int) indexPath.row);
    if (item) {
        cell.textLabel.text = item.description;
    } else {
        cell.textLabel.text = @"<NULL>";
    }
    return cell;
}

- (void)calculateSum {
    NSNumber *sum = fold(self.list, @0, ^(NSNumber *acc, NSNumber *item) {
        return @(acc.unsignedIntValue + item.unsignedIntValue);
    });
    if (sum) {
        self.title = [NSString stringWithFormat:@"Sum: %@", sum];
    }
}

@end