In Objective-C, a common yet subtle error arises when dealing with memory management and object lifecycles, especially when using delegates or blocks.  Consider this scenario:

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
@end
```

If `self.delegate` is a strong reference, and the delegate object is deallocated while `MyObject` still holds a strong reference to it, this will result in a dangling pointer.  Accessing `self.delegate` after deallocation can cause a crash.  Even worse, if `[self.delegate myObjectDidSomething:self]` causes the delegate to perform operations on itself, it will crash when `self.delegate` is deallocated.

Another subtle issue arises when using blocks.  If a block captures `self` strongly, and that block lives longer than the object that owns it, it prevents `self` from being deallocated, creating a strong reference cycle.