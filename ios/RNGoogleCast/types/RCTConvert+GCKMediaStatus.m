#import "RCTConvert+GCKMediaPlayerIdleReason.m"
#import "RCTConvert+GCKMediaPlayerState.m"
#import "RCTConvert+GCKMediaInformation.m"
#import "RCTConvert+GCKMediaRepeatMode.m"
#import "RCTConvert+GCKMediaQueueItem.m"
#import "RCTConvert+GCKVideoInfo.m"
#import "RCTConvert+GCKAdBreakStatus.m"
#import <GoogleCast/GoogleCast.h>
#import <React/RCTConvert.h>

@implementation RCTConvert (GCKMediaStatus)

+ (id)fromGCKMediaStatus:(GCKMediaStatus *)status {
  NSMutableDictionary *json = [[NSMutableDictionary alloc] init];

//  json[@"activeTrackIds"] = status.activeTrackIDs;

//  json[@"adBreakStatus"] = [RCTConvert fromGCKAdBreakStatus: status.adBreakStatus];

  json[@"currentItemId"] = @(status.currentItemID);
  
  json[@"currentQueueItem"] = [RCTConvert fromGCKMediaQueueItem:status.currentQueueItem];
  
  json[@"customData"] = status.customData;

  json[@"idleReason"] =
  [RCTConvert fromGCKMediaPlayerIdleReason:status.idleReason];

  json[@"isMuted"] = @(status.isMuted);

  json[@"loadingItemId"] = @(status.loadingItemID);

  json[@"mediaInfo"] =
  [RCTConvert fromGCKMediaInformation:status.mediaInformation];
  
//  json[@"mediaSessionId"] = @(status.mediaSessionID);

//  json[@"nextQueueItem"] = [RCTConvert fromGCKMediaQueueItem:status.nextQueueItem];

  json[@"playbackRate"] = @(status.playbackRate);

  json[@"playerState"] =
  [RCTConvert fromGCKMediaPlayerState:status.playerState];

  json[@"preloadedItemId"] = @(status.preloadedItemID);

//  json[@"queueHasCurrentItem"] = @(status.queueHasCurrentItem);
//
//  json[@"queueHasLoadingItem"] = @(status.queueHasLoadingItem);
//
//  json[@"queueHasNextItem"] = @(status.queueHasNextItem);
//
//  json[@"queueHasPreviousItem"] = @(status.queueHasPreviousItem);
//
//  json[@"queueItemCount"] = @(status.queueItemCount);
//
  json[@"queueRepeatMode"] = [RCTConvert fromGCKMediaRepeatMode:status.queueRepeatMode];

  json[@"streamPosition"] = @(status.streamPosition);
  
  json[@"videoInfo"] = [RCTConvert fromGCKVideoInfo:status.videoInfo];

  json[@"volume"] = @(status.volume);

  return json;
}

@end
