//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/Bus.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeChannelBus_H_
#define _ComGoodowRealtimeChannelBus_H_

@class ComGoodowRealtimeChannelStateEnum;
@protocol ComGoodowRealtimeChannelBusHook;
@protocol ComGoodowRealtimeCoreHandler;
@protocol ComGoodowRealtimeCoreRegistration;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeChannelBus < NSObject, JavaObject >

- (void)close;

- (ComGoodowRealtimeChannelStateEnum *)getReadyState;

- (NSString *)getSessionId;

- (id<ComGoodowRealtimeChannelBus>)publishWithNSString:(NSString *)topic
                                                withId:(id)msg;

- (id<ComGoodowRealtimeChannelBus>)publishLocalWithNSString:(NSString *)topic
                                                     withId:(id)msg;

- (id<ComGoodowRealtimeChannelBus>)sendWithNSString:(NSString *)topic
                                             withId:(id)msg
                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (id<ComGoodowRealtimeChannelBus>)sendLocalWithNSString:(NSString *)topic
                                                  withId:(id)msg
                        withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (id<ComGoodowRealtimeChannelBus>)setHookWithComGoodowRealtimeChannelBusHook:(id<ComGoodowRealtimeChannelBusHook>)hook;

- (id<ComGoodowRealtimeCoreRegistration>)subscribeWithNSString:(NSString *)topic
                              withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

- (id<ComGoodowRealtimeCoreRegistration>)subscribeLocalWithNSString:(NSString *)topic
                                   withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelBus_init() {}

FOUNDATION_EXPORT NSString *ComGoodowRealtimeChannelBus_ON_OPEN_;
J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeChannelBus, ON_OPEN_, NSString *)

FOUNDATION_EXPORT NSString *ComGoodowRealtimeChannelBus_ON_CLOSE_;
J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeChannelBus, ON_CLOSE_, NSString *)

FOUNDATION_EXPORT NSString *ComGoodowRealtimeChannelBus_ON_ERROR_;
J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeChannelBus, ON_ERROR_, NSString *)

#endif // _ComGoodowRealtimeChannelBus_H_
