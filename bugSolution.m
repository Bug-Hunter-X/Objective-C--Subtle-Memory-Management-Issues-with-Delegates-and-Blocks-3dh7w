```objectivec
@interface MyObject : NSObject
@property (nonatomic, weak) id <MyObjectDelegate> delegate;
@end

@protocol MyObjectDelegate <NSObject>
- (void)myObjectDidSomething:(MyObject *)object;
@end

@implementation MyObject
- (void)doSomething {
  // ... some work ...
  if (self.delegate) {
    [self.delegate myObjectDidSomething:self];
  }
}

- (void)useBlock {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{ 
        if (weakSelf) {
            // Access self safely here
        }
    });
}

@end
```
By using `weak` for the delegate and `__weak` within the block, we prevent retain cycles and ensure proper memory management.