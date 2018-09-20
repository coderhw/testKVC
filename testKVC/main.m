//
//  main.m
//  testKVC
//
//  Created by vanke on 2018/9/20.
//  Copyright © 2018年 vanke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHPerson.h"
#import "HHOberver.h"

/**
 KVC修改属性会触发KVO, KVC内部会触发KVO的监听
 也就是调用下面两个方法来触发kvo
 willChangeValueForKey:
 didChangeValueForKey:
 
 KVC赋值原理:
 1.setValue:forKey:
 2.按照setKey: _setKey:顺序寻找方法
 3.找到方法，传递参数，调用方法  没找到方法进行第四步
 4.查看accessInstanceVariableDirectly
 5.若accessInstanceVariableDirectly返回YES，则根据_key _isKey  key isKey顺序查找成员变量，找到了成员变量，直接赋值. 若没找到，进入第6步
 6.若accessInstanceVariableDirectly返回NO，调用valueForUndefiendKey,并抛出异常。NSUnKnowKeyException
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        HHOberver *observer = [[HHOberver alloc] init];
        HHPerson *person = [[HHPerson alloc] init];
        
        // 添加KVO监听
        [person addObserver:observer forKeyPath:@"age"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:NULL];
        
        
        // 通过KVC修改age属性
        [person setValue:@10 forKey:@"age"];
        
        //移除KVO监听
        [person removeObserver:observer forKeyPath:@"age"];
        
    }
    return 0;
}
