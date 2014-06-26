//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/BusHook.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeChannelBusHook_H_
#define _ComGoodowRealtimeChannelBusHook_H_

@protocol ComGoodowRealtimeChannelMessage;
@protocol ComGoodowRealtimeCoreHandler;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeChannelBusHook < NSObject, JavaObject >

- (void)handleOpened;

- (void)handlePostClose;

- (BOOL)handlePreClose;

- (BOOL)handlePreSubscribeWithNSString:(NSString *)topic
      withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)handler;

- (BOOL)handleReceiveMessageWithComGoodowRealtimeChannelMessage:(id<ComGoodowRealtimeChannelMessage>)message;

- (BOOL)handleSendOrPubWithBoolean:(BOOL)send
                      withNSString:(NSString *)topic
                            withId:(id)msg
  withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)replyHandler;

- (BOOL)handleUnsubscribeWithNSString:(NSString *)topic;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeChannelBusHook_init() {}

#endif // _ComGoodowRealtimeChannelBusHook_H_
