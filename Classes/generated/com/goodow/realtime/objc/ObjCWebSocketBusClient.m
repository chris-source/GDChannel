//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/objc/ObjCWebSocketBusClient.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "com/goodow/realtime/objc/ObjCSimpleBus.h"
#include "com/goodow/realtime/objc/ObjCWebSocketBusClient.h"

@implementation ComGoodowRealtimeObjcObjCWebSocketBusClient

+ (ComGoodowRealtimeObjcObjCWebSocketBusClient *)create:(NSString *)url options:(id<GDJsonObject>)options {
  return [[ComGoodowRealtimeObjcObjCWebSocketBusClient alloc] initWithNSString:url withGDJsonObject:options];
}

- (id)initWithNSString:(NSString *)url
      withGDJsonObject:(id<GDJsonObject>)options {
  return [super initWithNSString:url withGDJsonObject:options];
}

- (void)nativeHandleWithId:(id)message
                    withId:(id)handler {
  [ComGoodowRealtimeObjcObjCSimpleBus handleWithId:message withId:handler];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeObjcObjCWebSocketBusClient class]) {
    {
      (void) [[IOSClass classWithClass:[ComGoodowRealtimeObjcObjCSimpleBus class]] getSimpleName];
    }
  }
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "create:options:", "create", "Lcom.goodow.realtime.objc.ObjCWebSocketBusClient;", 0x8, NULL },
    { "initWithNSString:withGDJsonObject:", "ObjCWebSocketBusClient", NULL, 0x2, NULL },
    { "nativeHandleWithId:withId:", "nativeHandle", "V", 0x4, NULL },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeObjcObjCWebSocketBusClient = { "ObjCWebSocketBusClient", "com.goodow.realtime.objc", NULL, 0x0, 3, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeObjcObjCWebSocketBusClient;
}

@end