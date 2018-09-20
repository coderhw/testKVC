//
//  HHPerson.m
//  testKVC
//
//  Created by vanke on 2018/9/20.
//  Copyright © 2018年 vanke. All rights reserved.
//

#import "HHPerson.h"

@implementation HHPerson

- (void)setAge:(int)age
{
    _age = age;

    NSLog(@"setAge: - %d", age);
}



@end
