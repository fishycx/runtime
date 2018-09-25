//
//  ViewController.m
//  GCDTest
//
//  Created by fishycx on 2018/9/4.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self asyncConcurrent];
    [self dispatchSignal];
}

/**
 *可以使用dispatch_queue_create来创建队列，需要传入两个参数，第一个参数表示队列的唯一标识符，
  用于 DEBUG，可为空，Dispatch Queue 的名称推荐使用应用程序 ID 这种逆序全程域名；
  第二个参数用来识别是串行队列还是并发队列。DISPATCH_QUEUE_SERIAL 表示串行队列，
  DISPATCH_QUEUE_CONCURRENT 表示并发队列。
 */
- (void)creatGCDQueue {
    //串行队列
    dispatch_queue_t serialQueue= dispatch_queue_create("com.fishycx.GCDTest", DISPATCH_QUEUE_SERIAL);
    //并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.fishycx.GCDTest", DISPATCH_QUEUE_CONCURRENT);
    
    //特殊的串行队列 主队列 所有放在主队列中的任务，都会放到主线程中执行 可使用dispatch_get_main_queue()获得主队列。
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    //全局并发队列 Global Dispatch Queue 可以使用dispatch_get_global_queue来获取。需要传入两个参数。第一个参数表示队列优先级，一般用DISPATCH_QUEUE_PRIORITY_DEFAULT。第二个参数暂时没用，用0即可。
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    /********* * GCD 提供了同步执行任务的创建方法dispatch_sync和异步执行任务创建方法dispatch_async***********/
    
    //同步任务
    dispatch_sync(serialQueue, ^{
        
    });
    
    //异步任务
    dispatch_async(serialQueue, ^{
        
    });
}

/**
 虽然使用 GCD 只需两步，但是既然我们有两种队列（串行队列/并发队列），两种任务执行方式（同步执行/异步执行），那么我们就有了四种不同的组合方式。这四种不同的组合方式是：
 同步执行 + 并发队列
 异步执行 + 并发队列
 同步执行 + 串行队列
 异步执行 + 串行队列
 
 实际上，刚才还说了两种特殊队列：全局并发队列、主队列。全局并发队列可以作为普通并发队列来使用。但是主队列因为有点特殊，所以我们就又多了两种组合方式。这样就有六种不同的组合方式了。
 同步执行 + 主队列
 异步执行 + 主队列
----------------------------------------------------------------------------------------------------------------------------------
 区别        |             并发队列      |          串行队列             |              主队列
 ----------------------------------------------------------------------------------------------------------------------------------
 同步(sync)  |  没有开启新线程，串行执行任务 |   没有开启新线程，串行执行任务    |     主线程调用：死锁卡住不执行.其他线程调用：没有开启新线程，串行执行任务
 ---------------------------------------------------------------------------------------------------------------------------------
 异步(async) |  有开启新线程，并发执行任务   |   有开启新线程(1条)，串行执行任务 |    没有开启新线程，串行执行任务
 ---------------------------------------------------------------------------------------------------------------------------------------
 **/

//同步+并发队列，  * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。


- (void)syncConcurrent {
    NSLog(@"当前线程%@", [NSThread currentThread]);
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.fishycx.GCDTest", DISPATCH_QUEUE_CONCURRENT);
    //同步任务
    for (int i = 0; i < 8; i++) {
        [self doSyncTaskWithTaskIndex:i queue:concurrentQueue];
    }
}

//异步 + 并发队列 * 开辟新线程。任务交替执行
- (void)asyncConcurrent {
    NSLog(@"当前线程%@", [NSThread currentThread]);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.fishycx.GCDTest", DISPATCH_QUEUE_CONCURRENT);
    //同步任务
    for (int i = 0; i < 8; i++) {
        [self doAsyncTaskWithTaskIndex:i queue:concurrentQueue];
    }
}


// 控制线程数量
-(void)dispatchSignal {
    //crate的value表示，最多几个资源可访问
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //任务1
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 1");
        sleep(1);
        NSLog(@"complete task 1");
        dispatch_semaphore_signal(semaphore);
    });
    //任务2
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 2");
        sleep(1);
        NSLog(@"complete task 2");
        dispatch_semaphore_signal(semaphore);
    });
    //任务3
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 3");
        sleep(1);
        NSLog(@"complete task 3");
        dispatch_semaphore_signal(semaphore);
    });
}

- (void)doSyncTaskWithTaskIndex:(NSInteger)index queue:(dispatch_queue_t)queue {
    dispatch_sync(queue, ^{
        [self doTask:index];
    });
}

- (void)doAsyncTaskWithTaskIndex:(NSInteger)index queue:(dispatch_queue_t)queue {
    dispatch_async(queue, ^{
        [self doTask:index];
    });
}


- (void)doTask:(NSInteger)index {
    NSInteger sum = 0;
    for (int i = 0; i < 10; i++) {
        sum += i;
        sleep(1);
        NSLog(@"%ld,任务线程%@", index,[NSThread currentThread]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
