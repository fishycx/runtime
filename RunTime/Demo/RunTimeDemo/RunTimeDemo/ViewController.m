//
//  ViewController.m
//  RunTimeDemo
//
//  Created by fishycx on 2018/7/5.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "ViewController.h"
#import "helloClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    helloClass *v  = [helloClass new];
    [v hello];
    [helloClass hi];
    [v hello1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
