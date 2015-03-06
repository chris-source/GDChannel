//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/WebSocketBus.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/channel/BusHook.h"
#include "com/goodow/realtime/channel/Message.h"
#include "com/goodow/realtime/channel/State.h"
#include "com/goodow/realtime/channel/impl/MessageImpl.h"
#include "com/goodow/realtime/channel/impl/SimpleBus.h"
#include "com/goodow/realtime/channel/impl/WebSocketBus.h"
#include "com/goodow/realtime/channel/util/IdGenerator.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/Net.h"
#include "com/goodow/realtime/core/Platform.h"
#include "com/goodow/realtime/core/Registration.h"
#include "com/goodow/realtime/core/Scheduler.h"
#include "com/goodow/realtime/core/WebSocket.h"
#include "com/goodow/realtime/json/Json.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "java/lang/IllegalStateException.h"
#include "java/lang/RuntimeException.h"
#include "java/lang/Void.h"

@interface ComGoodowRealtimeChannelImplWebSocketBus () {
 @public
  id<ComGoodowRealtimeCoreWebSocket_WebSocketHandler> webSocketHandler_;
  jint pingInterval_;
  jint pingTimerID_;
  NSString *sessionId_;
  NSString *username_;
  NSString *password_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus, webSocketHandler_, id<ComGoodowRealtimeCoreWebSocket_WebSocketHandler>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus, sessionId_, NSString *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus, username_, NSString *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus, password_, NSString *)

@interface ComGoodowRealtimeChannelImplWebSocketBus_$1 () {
 @public
  ComGoodowRealtimeChannelImplWebSocketBus *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus_$1, this$0_, ComGoodowRealtimeChannelImplWebSocketBus *)

@interface ComGoodowRealtimeChannelImplWebSocketBus_$1_$1 () {
 @public
  ComGoodowRealtimeChannelImplWebSocketBus_$1 *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus_$1_$1, this$0_, ComGoodowRealtimeChannelImplWebSocketBus_$1 *)

@interface ComGoodowRealtimeChannelImplWebSocketBus_$2 () {
 @public
  ComGoodowRealtimeChannelImplWebSocketBus *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelImplWebSocketBus_$2, this$0_, ComGoodowRealtimeChannelImplWebSocketBus *)

@implementation ComGoodowRealtimeChannelImplWebSocketBus

NSString * ComGoodowRealtimeChannelImplWebSocketBus_SESSION_ = @"_session";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_USERNAME_ = @"username";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_PASSWORD_ = @"password";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_PING_INTERVAL_ = @"vertxbus_ping_interval";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_CHANNEL_ = @"realtime/channel";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_CONNECT_ = @"realtime/channel/_CONNECT";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_BODY_ = @"body";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_ = @"address";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_REPLY_TOPIC_ = @"replyAddress";
NSString * ComGoodowRealtimeChannelImplWebSocketBus_TYPE_ = @"type";

- (instancetype)initWithNSString:(NSString *)serverUri
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options {
  if (self = [super init]) {
    pingTimerID_ = -1;
    handlerCount_ = ComGoodowRealtimeJsonJson_createObject();
    webSocketHandler_ = [[ComGoodowRealtimeChannelImplWebSocketBus_$1 alloc] initWithComGoodowRealtimeChannelImplWebSocketBus:self];
    [self connectWithNSString:serverUri withComGoodowRealtimeJsonJsonObject:options];
  }
  return self;
}

- (void)connectWithNSString:(NSString *)serverUri
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options {
  self->serverUri_ = serverUri;
  pingInterval_ = options == nil || ![options hasWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_PING_INTERVAL_] ? 5 * 1000 : J2ObjCFpToInt([options getNumberWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_PING_INTERVAL_]);
  sessionId_ = options == nil || ![options hasWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_SESSION_] ? [((ComGoodowRealtimeChannelUtilIdGenerator *) nil_chk(idGenerator_)) nextWithInt:23] : [options getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_SESSION_];
  username_ = options == nil || ![options hasWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_USERNAME_] ? nil : [options getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_USERNAME_];
  password_ = options == nil || ![options hasWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_PASSWORD_] ? nil : [options getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_PASSWORD_];
  webSocket_ = [((id<ComGoodowRealtimeCoreNet>) nil_chk(ComGoodowRealtimeCorePlatform_net())) createWebSocketWithNSString:serverUri withComGoodowRealtimeJsonJsonObject:options];
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) setListenWithComGoodowRealtimeCoreWebSocket_WebSocketHandler:webSocketHandler_];
}

- (ComGoodowRealtimeChannelStateEnum *)getReadyState {
  return [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) getReadyState];
}

- (NSString *)getSessionId {
  return sessionId_;
}

- (void)doClose {
  (void) [self subscribeLocalWithNSString:ComGoodowRealtimeChannelBus_get_ON_CLOSE_() withComGoodowRealtimeCoreHandler:[[ComGoodowRealtimeChannelImplWebSocketBus_$2 alloc] initWithComGoodowRealtimeChannelImplWebSocketBus:self]];
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) close];
}

- (jboolean)doSubscribeWithBoolean:(jboolean)local
                      withNSString:(NSString *)topic
  withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  jboolean subscribed = [super doSubscribeWithBoolean:local withNSString:topic withComGoodowRealtimeCoreHandler:handler];
  if (local || !subscribed || (hook_ != nil && ![hook_ handlePreSubscribeWithNSString:topic withComGoodowRealtimeCoreHandler:handler])) {
    return NO;
  }
  if ([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(handlerCount_)) hasWithNSString:topic]) {
    (void) [handlerCount_ setWithNSString:topic withDouble:[handlerCount_ getNumberWithNSString:topic] + 1];
    return NO;
  }
  (void) [handlerCount_ setWithNSString:topic withDouble:1];
  [self sendSubscribeWithNSString:topic];
  return YES;
}

- (void)doSendOrPubWithBoolean:(jboolean)local
                   withBoolean:(jboolean)send
                  withNSString:(NSString *)topic
                        withId:(id)msg
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler {
  ComGoodowRealtimeChannelImplSimpleBus_checkNotNullWithNSString_withId_(ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_, topic);
  if (local) {
    [super doSendOrPubWithBoolean:local withBoolean:send withNSString:topic withId:msg withComGoodowRealtimeCoreHandler:replyHandler];
    return;
  }
  id<ComGoodowRealtimeJsonJsonObject> envelope = [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TYPE_ withId:send ? @"send" : @"publish"];
  (void) [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(envelope)) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_ withId:topic])) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_BODY_ withId:msg];
  if (replyHandler != nil) {
    NSString *replyTopic = [self makeUUID];
    (void) [envelope setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_REPLY_TOPIC_ withId:replyTopic];
    (void) [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(replyHandlers_)) setWithNSString:replyTopic withId:replyHandler];
  }
  [self sendWithComGoodowRealtimeJsonJsonObject:envelope];
}

- (jboolean)doUnsubscribeWithBoolean:(jboolean)local
                        withNSString:(NSString *)topic
    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler {
  jboolean unsubscribed = [super doUnsubscribeWithBoolean:local withNSString:topic withComGoodowRealtimeCoreHandler:handler];
  if (local || !unsubscribed || (hook_ != nil && ![hook_ handleUnsubscribeWithNSString:topic])) {
    return NO;
  }
  (void) [handlerCount_ setWithNSString:topic withDouble:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(handlerCount_)) getNumberWithNSString:topic] - 1];
  if ([handlerCount_ getNumberWithNSString:topic] == 0) {
    (void) [handlerCount_ removeWithNSString:topic];
    [self sendUnsubscribeWithNSString:topic];
    return YES;
  }
  return NO;
}

- (void)sendWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)msg {
  if ([self getReadyState] != ComGoodowRealtimeChannelStateEnum_get_OPEN()) {
    @throw [[JavaLangIllegalStateException alloc] initWithNSString:@"INVALID_STATE_ERR"];
  }
  [((id<ComGoodowRealtimeCoreWebSocket>) nil_chk(webSocket_)) sendWithNSString:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(msg)) toJsonString]];
}

- (void)sendConnect {
  id<ComGoodowRealtimeJsonJsonObject> msg = [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_SESSION_ withId:sessionId_];
  if (username_ != nil) {
    (void) [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(msg)) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_USERNAME_ withId:username_];
    if (password_ != nil) {
      (void) [msg setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_PASSWORD_ withId:password_];
    }
  }
  (void) [self sendWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_CONNECT_ withId:msg withComGoodowRealtimeCoreHandler:[[ComGoodowRealtimeChannelImplWebSocketBus_$3 alloc] init]];
}

- (void)sendPing {
  [self sendWithComGoodowRealtimeJsonJsonObject:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TYPE_ withId:@"ping"]];
}

- (void)sendSubscribeWithNSString:(NSString *)topic {
  NSAssert(topic != nil, @"topic shouldn't be null");
  id<ComGoodowRealtimeJsonJsonObject> msg = [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TYPE_ withId:@"register"])) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_ withId:topic];
  [self sendWithComGoodowRealtimeJsonJsonObject:msg];
}

- (void)sendUnsubscribeWithNSString:(NSString *)topic {
  id<ComGoodowRealtimeJsonJsonObject> msg = [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TYPE_ withId:@"unregister"])) setWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_ withId:topic];
  [self sendWithComGoodowRealtimeJsonJsonObject:msg];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplWebSocketBus *)other {
  [super copyAllFieldsTo:other];
  other->webSocketHandler_ = webSocketHandler_;
  other->serverUri_ = serverUri_;
  other->webSocket_ = webSocket_;
  other->pingInterval_ = pingInterval_;
  other->pingTimerID_ = pingTimerID_;
  other->sessionId_ = sessionId_;
  other->username_ = username_;
  other->password_ = password_;
  other->handlerCount_ = handlerCount_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withComGoodowRealtimeJsonJsonObject:", "WebSocketBus", NULL, 0x1, NULL },
    { "connectWithNSString:withComGoodowRealtimeJsonJsonObject:", "connect", "V", 0x1, NULL },
    { "getReadyState", NULL, "Lcom.goodow.realtime.channel.State;", 0x1, NULL },
    { "getSessionId", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "doClose", NULL, "V", 0x4, NULL },
    { "doSubscribeWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doSubscribe", "Z", 0x4, NULL },
    { "doSendOrPubWithBoolean:withBoolean:withNSString:withId:withComGoodowRealtimeCoreHandler:", "doSendOrPub", "V", 0x4, NULL },
    { "doUnsubscribeWithBoolean:withNSString:withComGoodowRealtimeCoreHandler:", "doUnsubscribe", "Z", 0x4, NULL },
    { "sendWithComGoodowRealtimeJsonJsonObject:", "send", "V", 0x4, NULL },
    { "sendConnect", NULL, "V", 0x4, NULL },
    { "sendPing", NULL, "V", 0x4, NULL },
    { "sendSubscribeWithNSString:", "sendSubscribe", "V", 0x4, NULL },
    { "sendUnsubscribeWithNSString:", "sendUnsubscribe", "V", 0x4, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "SESSION_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_SESSION_,  },
    { "USERNAME_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_USERNAME_,  },
    { "PASSWORD_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_PASSWORD_,  },
    { "PING_INTERVAL_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_PING_INTERVAL_,  },
    { "TOPIC_CHANNEL_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_CHANNEL_,  },
    { "TOPIC_CONNECT_", NULL, 0x19, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_CONNECT_,  },
    { "BODY_", NULL, 0x1c, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_BODY_,  },
    { "TOPIC_", NULL, 0x1c, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_TOPIC_,  },
    { "REPLY_TOPIC_", NULL, 0x1c, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_REPLY_TOPIC_,  },
    { "TYPE_", NULL, 0x1c, "Ljava.lang.String;", &ComGoodowRealtimeChannelImplWebSocketBus_TYPE_,  },
    { "webSocketHandler_", NULL, 0x12, "Lcom.goodow.realtime.core.WebSocket$WebSocketHandler;", NULL,  },
    { "serverUri_", NULL, 0x0, "Ljava.lang.String;", NULL,  },
    { "webSocket_", NULL, 0x0, "Lcom.goodow.realtime.core.WebSocket;", NULL,  },
    { "pingInterval_", NULL, 0x2, "I", NULL,  },
    { "pingTimerID_", NULL, 0x2, "I", NULL,  },
    { "sessionId_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "username_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "password_", NULL, 0x2, "Ljava.lang.String;", NULL,  },
    { "handlerCount_", NULL, 0x10, "Lcom.goodow.realtime.json.JsonObject;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelImplWebSocketBus = { 1, "WebSocketBus", "com.goodow.realtime.channel.impl", NULL, 0x1, 13, methods, 19, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplWebSocketBus;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelImplWebSocketBus)

@implementation ComGoodowRealtimeChannelImplWebSocketBus_$1

- (void)onCloseWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)reason {
  [((id<ComGoodowRealtimeCoreScheduler>) nil_chk(ComGoodowRealtimeCorePlatform_scheduler())) cancelTimerWithInt:this$0_->pingTimerID_];
  (void) [this$0_ publishLocalWithNSString:ComGoodowRealtimeChannelBus_get_ON_CLOSE_() withId:reason];
  if (this$0_->hook_ != nil) {
    [this$0_->hook_ handlePostClose];
  }
}

- (void)onErrorWithNSString:(NSString *)error {
  (void) [this$0_ publishLocalWithNSString:ComGoodowRealtimeChannelBus_get_ON_ERROR_() withId:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:@"message" withId:error]];
}

- (void)onMessageWithNSString:(NSString *)msg {
  id<ComGoodowRealtimeJsonJsonObject> json = ((id<ComGoodowRealtimeJsonJsonObject>) ComGoodowRealtimeJsonJson_parseWithNSString_(msg));
  ComGoodowRealtimeChannelImplMessageImpl *message = [[ComGoodowRealtimeChannelImplMessageImpl alloc] initWithBoolean:NO withBoolean:NO withComGoodowRealtimeChannelBus:this$0_ withNSString:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(json)) getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_get_TOPIC_()] withNSString:[json getStringWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_get_REPLY_TOPIC_()] withId:[json getWithNSString:ComGoodowRealtimeChannelImplWebSocketBus_get_BODY_()]];
  [this$0_ internalHandleReceiveMessageWithComGoodowRealtimeChannelMessage:message];
}

- (void)onOpen {
  [this$0_ sendConnect];
  [this$0_ sendPing];
  this$0_->pingTimerID_ = [((id<ComGoodowRealtimeCoreScheduler>) nil_chk(ComGoodowRealtimeCorePlatform_scheduler())) schedulePeriodicWithInt:this$0_->pingInterval_ withComGoodowRealtimeCoreHandler:[[ComGoodowRealtimeChannelImplWebSocketBus_$1_$1 alloc] initWithComGoodowRealtimeChannelImplWebSocketBus_$1:self]];
  if (this$0_->hook_ != nil) {
    [this$0_->hook_ handleOpened];
  }
  (void) [this$0_ publishLocalWithNSString:ComGoodowRealtimeChannelBus_get_ON_OPEN_() withId:nil];
}

- (instancetype)initWithComGoodowRealtimeChannelImplWebSocketBus:(ComGoodowRealtimeChannelImplWebSocketBus *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplWebSocketBus_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "onCloseWithComGoodowRealtimeJsonJsonObject:", "onClose", "V", 0x1, NULL },
    { "onErrorWithNSString:", "onError", "V", 0x1, NULL },
    { "onMessageWithNSString:", "onMessage", "V", 0x1, NULL },
    { "onOpen", NULL, "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplWebSocketBus:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelImplWebSocketBus_$1 = { 1, "$1", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 5, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplWebSocketBus_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelImplWebSocketBus_$1)

@implementation ComGoodowRealtimeChannelImplWebSocketBus_$1_$1

- (void)handleWithId:(id)ignore {
  [this$0_->this$0_ sendPing];
}

- (instancetype)initWithComGoodowRealtimeChannelImplWebSocketBus_$1:(ComGoodowRealtimeChannelImplWebSocketBus_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplWebSocketBus_$1_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "handleWithJavaLangVoid:", "handle", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplWebSocketBus_$1:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus$1;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelImplWebSocketBus_$1_$1 = { 1, "$1", "com.goodow.realtime.channel.impl", "WebSocketBus$$1", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplWebSocketBus_$1_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelImplWebSocketBus_$1_$1)

@implementation ComGoodowRealtimeChannelImplWebSocketBus_$2

- (void)handleWithId:(id<ComGoodowRealtimeChannelMessage>)event {
  [this$0_ clearHandlers];
  (void) [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(this$0_->handlerCount_)) clear];
}

- (instancetype)initWithComGoodowRealtimeChannelImplWebSocketBus:(ComGoodowRealtimeChannelImplWebSocketBus *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelImplWebSocketBus_$2 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "handleWithComGoodowRealtimeChannelMessage:", "handle", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeChannelImplWebSocketBus:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.channel.impl.WebSocketBus;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelImplWebSocketBus_$2 = { 1, "$2", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeChannelImplWebSocketBus_$2;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelImplWebSocketBus_$2)

@implementation ComGoodowRealtimeChannelImplWebSocketBus_$3

- (void)handleWithId:(id<ComGoodowRealtimeChannelMessage>)message {
  if ([((id<ComGoodowRealtimeChannelMessage>) nil_chk(message)) body] != nil && [((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([message body])) getNumberWithNSString:@"code"] != 0) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([message body])) toJsonString]];
  }
}

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "handleWithComGoodowRealtimeChannelMessage:", "handle", "V", 0x1, NULL },
    { "init", NULL, NULL, 0x0, NULL },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeChannelImplWebSocketBus_$3 = { 1, "$3", "com.goodow.realtime.channel.impl", "WebSocketBus", 0x8000, 2, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeChannelImplWebSocketBus_$3;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeChannelImplWebSocketBus_$3)
