//
//  ViewController.m
//  MMHAchiveTool
//
//  Created by fishycx on 2018/8/27.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    NSButton *button = [NSButton buttonWithTitle:@"test" target:self action:@selector(task)];
    [self.view addSubview:button];
}

- (void)task {
    NSLog(@"%d,%s", __LINE__, __func__);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
