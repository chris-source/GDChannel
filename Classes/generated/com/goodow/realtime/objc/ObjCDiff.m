//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/objc/ObjCDiff.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/core/Diff.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/objc/ObjCDiff.h"
#include "java/util/Comparator.h"

#import "JavaObjCDiff+Adapter.h"

@implementation ComGoodowRealtimeObjcObjCDiff

- (void)diffWithNSString:(NSString *)before
            withNSString:(NSString *)after
withComGoodowRealtimeCoreDiff_ListTarget:(id<ComGoodowRealtimeCoreDiff_ListTarget>)target {
  [self diff:before after:after target:target];
}

- (void)diffWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)before
            withComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)after
      withComGoodowRealtimeCoreDiff_ListTarget:(id<ComGoodowRealtimeCoreDiff_ListTarget>)target
                        withJavaUtilComparator:(id<JavaUtilComparator>)comparator {
  
}

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "diffWithNSString:withNSString:withComGoodowRealtimeCoreDiff_ListTarget:", "diff", "V", 0x101, NULL },
    { "diffWithComGoodowRealtimeJsonJsonArray:withComGoodowRealtimeJsonJsonArray:withComGoodowRealtimeCoreDiff_ListTarget:withJavaUtilComparator:", "diff", "V", 0x101, NULL },
    { "init", NULL, NULL, 0x0, NULL },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeObjcObjCDiff = { 1, "ObjCDiff", "com.goodow.realtime.objc", NULL, 0x0, 3, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeObjcObjCDiff;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeObjcObjCDiff)
