//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/impl/ReconnectBus.java
//

#ifndef _ComGoodowRealtimeChannelImplReconnectBus_H_
#define _ComGoodowRealtimeChannelImplReconnectBus_H_

@class ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator;
@class JavaLangVoid;
@protocol ComGoodowRealtimeChannelBus;
@protocol ComGoodowRealtimeChannelBusHook;
@protocol ComGoodowRealtimeJsonJsonArray;
@protocol ComGoodowRealtimeJsonJsonObject;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/channel/impl/BusHookProxy.h"
#include "com/goodow/realtime/channel/impl/WebSocketBus.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/json/JsonArray.h"

@interface ComGoodowRealtimeChannelImplReconnectBus : ComGoodowRealtimeChannelImplWebSocketBus {
}

- (instancetype)initWithNSString:(NSString *)serverUri
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options;

- (void)reconnect;

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook;

- (void)doClose;

- (void)sendWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)msg;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplReconnectBus)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT NSString *ComGoodowRealtimeChannelImplReconnectBus_AUTO_RECONNECT_;
J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeChannelImplReconnectBus, AUTO_RECONNECT_, NSString *)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplReconnectBus)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1 : ComGoodowRealtimeChannelImplBusHookProxy {
}

- (void)handleOpened;

- (void)handlePostClose;

- (id<ComGoodowRealtimeChannelBusHook>)delegate;

- (instancetype)initWithComGoodowRealtimeChannelImplReconnectBus:(ComGoodowRealtimeChannelImplReconnectBus *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplReconnectBus_$1)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplReconnectBus_$1)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$1 : NSObject < ComGoodowRealtimeJsonJsonArray_ListIterator > {
}

- (void)callWithInt:(jint)index
             withId:(NSString *)topic;

- (instancetype)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplReconnectBus_$1_$1)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplReconnectBus_$1_$1)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$2 : NSObject < ComGoodowRealtimeJsonJsonArray_ListIterator > {
}

- (void)callWithInt:(jint)index
             withId:(id<ComGoodowRealtimeJsonJsonObject>)msg;

- (instancetype)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplReconnectBus_$1_$2)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplReconnectBus_$1_$2)

@interface ComGoodowRealtimeChannelImplReconnectBus_$1_$3 : NSObject < ComGoodowRealtimeCoreHandler > {
}

- (void)handleWithId:(id)event;

- (instancetype)initWithComGoodowRealtimeChannelImplReconnectBus_$1:(ComGoodowRealtimeChannelImplReconnectBus_$1 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeChannelImplReconnectBus_$1_$3)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeChannelImplReconnectBus_$1_$3)

#endif // _ComGoodowRealtimeChannelImplReconnectBus_H_
