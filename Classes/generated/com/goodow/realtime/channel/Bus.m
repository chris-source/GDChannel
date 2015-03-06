//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/Bus.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/BusHook.h"
#include "com/goodow/realtime/channel/State.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/Registration.h"
#include "com/google/gwt/core/client/js/JsType.h"

@interface ComGoodowRealtimeChannelBus : NSObject
@end

NSString * ComGoodowRealtimeChannelBus_ON_OPEN_ = @"@realtime/bus/onOpen";
NSString * ComGoodowRealtimeChannelBus_ON_CLOSE_ = @"@realtime/bus/onClose";
NSString * ComGoodowRealtimeChannelBus_ON_ERROR_ = @"@realtime/bus/onError";

@implementation ComGoodowRealtimeChannelBus

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "close", NULL, "V", 0x401, NULL },
    { "getReadyState", NULL, "Lcom.goodow.realtime.channel.State;", 0x401, NULL },
    { "getSessionId", NULL, "Ljava.lang.String;", 0x401, NULL },
    { "publishWithNSString:withId:", "publish", "Lcom.goodow.realtime.channel.Bus;", 0x401, NULL },
    { "publishLocalWithNSString:withId:", "publishLocal", "Lcom.goodow.realtime.channel.Bus;", 0x401, NULL },
    { "sendWithNSString:withId:withComGoodowRealtimeCoreHandler:", "send", "Lcom.goodow.realtime.channel.Bus;", 0x401, NULL },
    { "sendLocalWithNSString:withId:withComGoodowRealtimeCoreHandler:", "sendLocal", "Lcom.goodow.realtime.channel.Bus;", 0x401, NULL },
    { "setHookWithComGoodowRealtimeChannelBusHook:", "setHook", "Lcom.goodow.realtime.channel.Bus;", 0x401, NULL },
    { "subscribeWithNSString:withComGoodowRealtimeCoreHandler:", "subscribe", "Lcom.goodow.realtime.core.Registration;", 0x401, NULL },
    { "subscribeLocalWithNSString:withComGoodowRealtimeCoreHandler:", "subscribeLocal", "Lcom.goodow.realtime.core.Registration;", 0x401, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "ON_OPEN_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelBus_ON_OPEN_,  },
    { "ON_CLOSE_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelBus_ON_CLOSE_,  },
    { "ON_ERROR_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelBus_ON_ERROR_,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelBus = { 1, "Bus", "com.goodow.realtime.channel", NULL, 0x201, 10, methods, 3, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelBus;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelBus)
