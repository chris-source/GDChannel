//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/core/Diff.java
//
//  Created by retechretech.
//

#include "com/goodow/realtime/core/Diff.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "java/util/Comparator.h"

@interface ComGoodowRealtimeCoreDiff : NSObject
@end

@implementation ComGoodowRealtimeCoreDiff

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "diffWithNSString:withNSString:withComGoodowRealtimeCoreDiff_ListTarget:", "diff", "V", 0x401, NULL },
    { "diffWithComGoodowRealtimeJsonJsonArray:withComGoodowRealtimeJsonJsonArray:withComGoodowRealtimeCoreDiff_ListTarget:withJavaUtilComparator:", "diff", "V", 0x401, NULL },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeCoreDiff = { "Diff", "com.goodow.realtime.core", NULL, 0x201, 2, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeCoreDiff;
}

@end

@interface ComGoodowRealtimeCoreDiff_ListTarget : NSObject
@end

@implementation ComGoodowRealtimeCoreDiff_ListTarget

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "insertWithInt:withId:", "insert", "V", 0x401, NULL },
    { "removeWithInt:withInt:", "remove", "V", 0x401, NULL },
    { "replaceWithInt:withId:", "replace", "V", 0x401, NULL },
    { "moveWithInt:withInt:withInt:", "move", "V", 0x401, NULL },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeCoreDiff_ListTarget = { "ListTarget", "com.goodow.realtime.core", "Diff", 0x209, 4, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeCoreDiff_ListTarget;
}

@end