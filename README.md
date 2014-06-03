## cocoa-scratch

minimal template project to try CocoaPods libraries without Xcode.

## usage

1. write `Podfile`
2. write `a.m`
3. execute `make` command


## example

#### Podfile

```
platform :osx, '10.9'

pod 'ReactiveCocoa'
```

#### a.m

```
#include <Foundation/Foundation.h>
#include <ReactiveCocoa/ReactiveCocoa/ReactiveCocoa.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    [subscriber sendNext:@"signal!"];
                    [subscriber sendCompleted];
                    return nil;
                }] 
            subscribeNext:^(id x) {
                NSLog(@"received: %@", x);
            } completed:^() {
                NSLog(@"completed");
            }];

        return 0;
    }
}
```
