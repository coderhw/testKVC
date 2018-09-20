//
//  HHOberver.m
//  testKVC
//
//  Created by vanke on 2018/9/20.
//  Copyright © 2018年 vanke. All rights reserved.
//

#import "HHOberver.h"

@implementation HHOberver

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    NSLog(@"observeValueForKeyPath - %@", change);
}


@end
