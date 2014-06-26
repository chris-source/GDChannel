//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/ReconnectBus.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/BusHook.h"
#include "com/goodow/realtime/channel/State.h"
#include "com/goodow/realtime/channel/impl/ReconnectBus.h"
#include "com/goodow/realtime/channel/impl/WebSocketBus.h"
#include "com/goodow/realtime/channel/util/FuzzingBackOffGenerator.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/Scheduler.h"
#include "com/goodow/realtime/core/WebSocket.h"
#include "com/goodow/realtime/json/Json.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "com/google/gwt/core/client/js/JsExport.h"
#include "com/google/gwt/core/client/js/JsNamespace.h"
#include "java/lang/Void.h"

@implementation ComGoodowRealtimeChannelImplReconnectBus

NSString * ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_ = @"reconnect";

- (id)initWithNSString:(NSString *)serverUri
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options {
  if (self = [super initWithNSString:serverUri withComGoodowRealtimeJsonJsonObject:options]) {
    queuedMessages_ = [ComGoodowRealtimeJsonJson createArray];
    self->options_ = options;
    reconnect__ = options == nil || ![options hasWithNSString:ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_] ? YES : [options getBooleanWithNSString:ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_];
    backOffGenerator_ = [[ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator alloc] initWithInt:1 * 1000 withInt:30 * 60 * 1000 withDouble:0.5];
    (void) [super setHookWithComGoodowRealtimeChannelBusHook:[[ComGoodowRealtimeChannelImplReconnectBus_$1 alloc] initWithComGoodowRealtimeChannelImplReconnectBus:self]];
  }
  return self;
}

- (void)reconnect {
  if ([self getReadyState] == ComGoodowRealtimeChannelStateEnum_get_OPEN() || [self getReadyState] == ComGoodowRealtimeChannelStateEnum_get_CONNECTING()) {
    return;
  }
  if (webSocket_ != nil) {
    [webSocket_ close];
  }
  [self connectWithNSString:serverUri_ withComGoodowRealtimeJsonJsonObject:options_];
}

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook {
  self->hook_ReconnectBus_ = hook;
  return self;
}

- (void)doClose {
  reconnect__ = NO;
  [((ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *) nil_chk(backOffGenerator_)) reset];
  (void) [((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(queuedMessages_)) clear];
  [super doClose];
}

- (void)sendWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)msg {
  if ([self getReadyState] == ComGoodowRealtimeChannelStateEnum_get_OPEN()) {
    [super sendWithComGoodowRealtimeJsonJsonObject:msg];
    return;
  }
  if (reconnect__) {
    [self reconnect];
  }
  NSString *type = [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(msg)) getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_get_TYPE_()];
  if ([@"ping" isEqual:type] || [@"register" isEqual:type]) {
    return;
  }
  (void) [((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(queuedMessages_)) pushWithId:msg];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplReconnectBus *)other {
  [super copyAllFieldsTo:other];
  other->backOffGenerator_ = backOffGenerator_;
  other->hook_ReconnectBus_ = hook_ReconnectBus_;
  other->options_ = options_;
  other->queuedMessages_ = queuedMessages_;
  other->reconnect__ = reconnect__;
}
+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[ComGoogleGwtCoreClientJsJsNamespace alloc] initWithValue:@"$wnd.realtime.channel"] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_ComGoodowRealtimeChannelImplReconnectBusWithNSString_withComGoodowRealtimeJsonJsonObject_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[ComGoogleGwtCoreClientJsJsExport alloc] initWithValue:@""] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}


+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withComGoodowRealtimeJsonJsonObject:", "ReconnectBus", NULL, 0x1, NULL },
    { "reconnect", NULL, "V", 0x1, NULL },
    { "setHookWithComGoodowRealtimeChannelBusHook:", "setHook", "Lcom.goodow.realtime.channel.Bus;", 0x1, NULL },
    { "doClose", NULL, "V", 0x4, NULL },
    { "sendWithComGoodowRealtimeJsonJsonObject:", "send", "V", 0x4, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "AUTO_RECONNECT_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_,  },
    { "backOffGenerator_", NULL, 0x12, "Lcom.goodow.realtime.channel.util.FuzzingBackOffGenerator;", NULL,  },
    { "hook_ReconnectBus_", "hook", 0x2, "Lcom.goodow.realtime.channel.BusHook;", NULL,  },
    { "reconnect__", "reconnect", 0x2, "Z", NULL,  },
    { "queuedMessages_", NULL, 0x12, "Lcom.goodow.realtime.json.JsonArray;", NULL,  },
    { "options_", NULL, 0x12, "Lcom.goodow.realtime.json.JsonObject;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplReconnectBus = { "ReconnectBus", "com.goodow.realtime.channel.impl", NULL, 0x1, 5, methods, 6, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplReconnectBus;
}

@end

@implementation ComGoodowRealtimeChannelImplReconnectBus_$1

- (void)handleOpened {
  [((ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *) nil_chk(this$0_->backOffGenerator_)) reset];
  [((id<ComGoodowRealtimeJsonJsonArray>) nil_chk([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(this$0_->handlerCount_)) keys])) forEachWithComGoodowRealtimeJsonJsonArray_ListIterator:[[ComGoodowRealtimeChannelImplReconnectBus_$1_$1 alloc] initWithComGoodowRealtimeChannelImplReconnectBus_$1:self]];
  if ([((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(this$0_->queuedMessages_)) length] > 0) {
    id<ComGoodowRealtimeJsonJsonArray> copy_ = [this$0_->queuedMessages_ copy__];
    (void) [this$0_->queuedMessages_ clear];
    [((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(copy_)) forEachWithComGoodowRealtimeJsonJsonArray_ListIterator:[[ComGoodowRealtimeChannelImplReconnectBus_$1_$2 alloc] initWithComGoodowRealtimeChannelImplReconnectBus_$1:self]];
  }
  [super handleOpened];
}

- (void)handlePostClose {
  if (this$0_->reconnect__) {
    [((id<ComGoodowRealtimeCoreScheduler>) nil_chk([ComGoodowRealtimeCorePlatform scheduler])) scheduleDelayWithInt:((ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_BackOffParameters *) nil_chk([((ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *) nil_chk(this$0_->backOffGenerator_)) next]))->targetDelay_ withComGoodowRealtimeCoreHandler:[[ComGoodowRealtimeChannelImplReconnectBus_$1_$3 alloc] initWithComGoodowRealtimeChannelImplReconnectBus_$1:self]];
  }
  [super handlePostClose];
}

- (id<ComGoodowRealtimeChannelBusHook>)delegate {
  return this$0_->hook_ReconnectBus_;
}

- (id)initWithComGoodowRealtimeChannelImplReconnectBus:(ComGoodowRealtimeChannelImplReconnectBus *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleOpened", NULL, "V", 0x1, NULL },
    { "handlePostClose", NULL, "V", 0x1, NULL },
    { "delegate", NULL, "Lcom.goodow.realtime.channel.BusHook;", 0x4, NULL },
    { "initWithComGoodowRealtimeChannelImplReconnectBus:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.ReconnectBus;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplReconnectBus_$1 = { "$1", "com.goodow.realtime.channel.impl", "ReconnectBus", 0x8000, 4, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplReconnectBus_$1;
}

@end

@implementation ComGoodowRealtimeChannelImplReconnectBus_$1_$1

- (void)callWithInt:(int)index
             withId:(NSString *)topic {
  NSAssert([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(this$0_->this$0_->handlerCount_)) getNumberWithNSString:topic] > 0, [[NSString stringWithFormat:@"Handlers registried on %@ shouldn't be empty" J2OBJC_COMMA() topic] description]);
  [this$0_->this$0_ sendUnsubscribeWithNSString:topic];
  [this$0_->this$0_ sendSubscribeWithNSString:topic];
}

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "callWithInt:withNSString:", "call", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplReconnectBus_$1:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.ReconnectBus$1;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplReconnectBus_$1_$1 = { "$1", "com.goodow.realtime.channel.impl", "ReconnectBus$$1", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplReconnectBus_$1_$1;
}

@end

@implementation ComGoodowRealtimeChannelImplReconnectBus_$1_$2

- (void)callWithInt:(int)index
             withId:(id<ComGoodowRealtimeJsonJsonObject>)msg {
  [this$0_->this$0_ sendWithComGoodowRealtimeJsonJsonObject:msg];
}

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "callWithInt:withComGoodowRealtimeJsonJsonObject:", "call", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplReconnectBus_$1:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.ReconnectBus$1;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplReconnectBus_$1_$2 = { "$2", "com.goodow.realtime.channel.impl", "ReconnectBus$$1", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplReconnectBus_$1_$2;
}

@end

@implementation ComGoodowRealtimeChannelImplReconnectBus_$1_$3

- (void)handleWithId:(id)event {
  if (this$0_->this$0_->reconnect__) {
    [this$0_->this$0_ reconnect];
  }
}

- (id)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "handleWithJavaLangVoid:", "handle", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplReconnectBus_$1:", "init", NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.ReconnectBus$1;", NULL,  },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeChannelImplReconnectBus_$1_$3 = { "$3", "com.goodow.realtime.channel.impl", "ReconnectBus$$1", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplReconnectBus_$1_$3;
}

@end
