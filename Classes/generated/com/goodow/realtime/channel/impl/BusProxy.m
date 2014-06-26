//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/BusProxy.java
//
//  Created by retechretech.
//

#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/BusHook.h"
#include "com/goodow/realtime/channel/State.h"
#include "com/goodow/realtime/channel/impl/BusProxy.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/Registration.h"

@implementation ComGoodowRealtimeChannelImplBusProxy

- (id)initWithComGoodowRealtimeChannelBus:(id<ComGoodowRealtimeChannelBus>)delegate {
  if (self = [super init]) {
    self->delegate_ = delegate;
  }
  return self;
}

- (void)close {
  [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) close];
}

- (id<ComGoodowRealtimeChannelBus>)getDelegate {
  return delegate_;
}

- (ComGoodowRealtimeChannelStateEnum *)getReadyState {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) getReadyState];
}

- (NSString *)getSessionId {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) getSessionId];
}

- (id<ComGoodowRealtimeChannelBus>)publishWithNSString:(NSString *)topic
                                                withId:(id)msg {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) publishWithNSString:topic withId:msg];
}

- (id<ComGoodowRealtimeChannelBus>)publishLocalWithNSString:(NSString *)topic
                                                     withId:(id)msg {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) publishLocalWithNSString:topic withId:msg];
}

- (id<ComGoodowRealtimeCoreRegistration>)subscribeWithNSString:(NSString *)topic
                              withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) subscribeWithNSString:topic withComGoodowRealtimeCoreHandler:handler];
}

- (id<ComGoodowRealtimeCoreRegistration>)subscribeLocalWithNSString:(NSString *)topic
                                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) subscribeLocalWithNSString:topic withComGoodowRealtimeCoreHandler:handler];
}

- (id<ComGoodowRealtimeChannelBus>)sendWithNSString:(NSString *)topic
                                             withId:(id)msg
                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) sendWithNSString:topic withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
}

- (id<ComGoodowRealtimeChannelBus>)sendLocalWithNSString:(NSString *)topic
                                                  withId:(id)msg
                        withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  return [((id<ComGoodowRealtimeChannelBus>) nil_chk(delegate_)) sendLocalWithNSString:topic withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
}

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook {
  self->hook_ = hook;
  return self;
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplBusProxy *)other {
  [super copyAllFieldsTo:other];
  other->delegate_ = delegate_;
  other->hook_ = hook_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithComGoodowRealtimeChannelBus:", "BusProxy", NULL, 0x1, NULL },
    { "close", NULL, "V", 0x1, NULL },
    { "getDelegate", NULL, "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "getReadyState", NULL, "Lcom.goodow.realtime.channel.State;", 0x1, NULL },
    { "getSessionId", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "publishWithNSString:withId:", "publish", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "publishLocalWithNSString:withId:", "publishLocal", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "subscribeWithNSString:withComGoodowRealtimeCoreHandler:", "subscribe", "Lcom.goodow.realtime.core.Registration;", 0x1, NULL },
    { "subscribeLocalWithNSString:withComGoodowRealtimeCoreHandler:", "subscribeLocal", "Lcom.goodow.realtime.core.Registration;", 0x1, NULL },
    { "sendWithNSString:withId:withComGoodowRealtimeCoreHandler:", "send", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "sendLocalWithNSString:withId:withComGoodowRealtimeCoreHandler:", "sendLocal", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "setHookWithComGoodowRealtimeChannelBusHook:", "setHook", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "delegate_", NULL, 0x14, "Lcom.goodow.realtime.channel.Bus;", NULL,  },
    { "hook_", NULL, 0x4, "Lcom.goodow.realtime.channel.BusHook;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplBusProxy = { "BusProxy", "com.goodow.realtime.channel.impl", NULL, 0x401, 12, methods, 2, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplBusProxy;
}

@end
