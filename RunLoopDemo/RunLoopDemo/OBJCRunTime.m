//
//  OBJCRunTime.m
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/12/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

#import "OBJCRunTime.h"
#import <objc/runtime.h>
#import "MyThread.h"
@implementation OBJCRunTime

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self testRuntime];
    }
    return self;
}

- (void)testRuntime
{
    MyThread *thread = [[MyThread alloc] init];
    Class cls = MyThread.class;
    const char *name = class_getName(cls);
    NSLog(@"class-name:%s", name);
    unsigned int count;
    //c language
    Ivar *ivars = class_copyIvarList(cls, &count);
    objc_property_t *propertylist = class_copyPropertyList(cls, &count);
    NSLog(@"all-ivars:%c",ivars);
    NSLog(@"all-propertys:%c",propertylist);
    
    class_addIvar(cls, "aName", sizeof(NSString *), log(sizeof(NSString *)), "i");
    
    Class clss = objc_getClass("MyThread");
    const char *Nname = class_getName(clss);
    NSLog(@"class-name----:%s", Nname);
    class_getSuperclass(cls);
    class_isMetaClass(cls);
    
}

@end
