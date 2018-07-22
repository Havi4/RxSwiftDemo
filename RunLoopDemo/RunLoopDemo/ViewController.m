//
//  ViewController.m
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/10/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MyThread.h"
#import "OBJCRunTime.h"
#import "RunLoopDemo-Swift.h"

@interface ViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSThread *myThread;
@property (nonatomic, strong) MyThread *subThread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self willChangeValueForKey:@""];
    // Do any additional setup after loading the view, typically from a nib.
//    [self doNetworking];
//    [self getCurrentRunLoop];
//    [self crashAfterSecode];
//    SwiftBook *book = [[SwiftBook alloc] init];
    DemoLevel *demo = [[DemoLevel alloc] init];
    SwiftClosures *closures = [[SwiftClosures alloc] init];
    _subThread = [[MyThread alloc] initWithTarget:self selector:@selector(subThread:) object:nil];
    [_subThread setName:@"mySubThread"];
    [_subThread start];
    
    int balance[5] = {1000, 2, 3, 7, 50};
//    buddle(balance, 5);
    quick_sort(balance, 0, 5);
    NSLog(@"hhhh%d",balance[0]);
//    OBJCRunTime *c = [[OBJCRunTime alloc] init];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    view1.userInteractionEnabled = YES;
    UITapGestureRecognizer *get = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
    [view1 addGestureRecognizer:get];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 200, 200)];
    UITapGestureRecognizer *get2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
    [view2 addGestureRecognizer:get2];
    view2.userInteractionEnabled = YES;
    view2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view2];
}

- (void)taped:(UITapGestureRecognizer *)ges
{
    NSLog(@"%@",ges.view);
}

int gcd(int a, int b)
{
    if (b > a) {
        int tem = a;
        a = b;
        b = tem;
    }
    while (b != 0) {
        int tem = a % b;
        a = b;
        b = tem;
    }
    return b;
}

void buddle(int s[], int length)
{
    for (int i = 0; i < length; i++) {
        for (int j = i; j < length; j++) {
            if (s[j]<s[i]) {
                int tem = s[i];
                s[i] = s[j];
                s[j] = tem;
            }
        }
    }
}

void quick_sort(int s[], int l, int r)
{
    if (l < r) {
        int i = l, j = r, x = s[l];
        while (i < j) {
            while (i<j && s[j] >= x) {
                j--;
            }
            if (i < j) {
                s[i] = s[j];
            }
            
            while (i < j && s[i] <= x) {
                i++;
            }
            
            if (i < j) {
                s[j] = s[i];
            }
        }
        s[i] = x;
        
        quick_sort(s, l, i-1);
        quick_sort(s, i+1, r);
    }
}

void sort(int s[], int l, int r)
{
    if (l < r) {
        int i = l, j = r, x = s[l];
        while (i < j) {
            while (i<j && s[j] >= x) {
                j--;
            }
            if (i<j) {
                s[i] = s[j];
            }
            
            while (i<j && s[i] <=x ) {
                i++;
            }
            if (i<j) {
                s[j] = s[i];
            }
        }
        s[i] = x;
        sort(s, l, i-1);
        sort(s, i+1, r);
        
    }
}

int factorial(int a)
{
    if (a > 100) {
        return 0;
    }
    
    if (a == 1 || a == 0) {
        return 1;
    }
    
    return a*factorial(a-1);
}

- (void)subThread:(id)obj
{
    NSLog(@"start-sub-thread");
}

- (void)crashAfterSecode
{
    NSArray *a = @[@"d"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [a objectAtIndex:9];
    });
}

int bianrySearch(int s[], int len, int goal)
{
    int low = 0, high = len - 1;
    while (low < high) {
        int middle = (high - low) / 2 + low;
        if (s[middle] == goal) {
            return s[middle];
        }
        
        if (middle < goal) {
            low = middle-1;
        }
        
        if (middle > goal) {
            high = middle+1;
        }
    }
    
    return -1;
    
}

- (void)doNetworking
{
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    NSURLConnection *connect = [NSURLConnection connectionWithRequest:request delegate:self];
    [connect start];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self performSelector:@selector(doBackWork) onThread:self.myThread withObject:nil waitUntilDone:YES];
}

- (NSThread*)myThread
{
    if (!_myThread) {
        _myThread = [[NSThread alloc] initWithBlock:^{
            NSRunLoop *loop = [NSRunLoop currentRunLoop];
            [loop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
            [loop run];
        }];
        [_myThread start];
    }
    return _myThread;
}

- (void)doBackWork
{
    NSLog(@"do-work");
}

- (void)getCurrentRunLoop
{
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
//    NSLog(@"current-runloop-is:%@",loop);
    CFRunLoopRef cfLoop = CFRunLoopGetCurrent();
//    NSLog(@"cfcurrent-runloop-is:%@",cfLoop);
//    kCFRunLoopCommonModes;
//    kCFRunLoopDefaultMode;
//    NSRunLoopCommonModes
    [self performSelectorOnMainThread:@selector(testSource0:) withObject:@{@"key":@"main"} waitUntilDone:YES];
    
    [self performSelector:@selector(testPer) onThread:[NSThread currentThread] withObject:nil waitUntilDone:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"new-thread:%@",[NSThread currentThread]);
    });
}

- (void)testPer
{
    NSLog(@"is-per");
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"loog-%lu",activity);
        
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
    
    
    
}

+ (void)requestEntryPoint
{
    static NSThread *networkThread = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkThread = [[NSThread alloc]initWithTarget:self selector:@selector(networkThreadEntryPoint:) object:nil];
        [networkThread start];
    });
}

+ (void)networkThreadEntryPoint:(id)obj
{
    @autoreleasepool {
        [[NSThread currentThread] setName:@"com.networking.thread"];
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        [loop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [loop run];
    }
}


- (void)testSource0:(NSDictionary *)dic
{
    CFRunLoopRef loop = CFRunLoopGetMain();
    NSLog(@"new-is:%@:%@",loop,dic);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"done");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
