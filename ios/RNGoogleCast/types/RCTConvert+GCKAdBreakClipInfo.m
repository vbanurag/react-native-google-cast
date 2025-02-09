#import "RCTConvert+GCKHLSSegmentFormat.m"
#import <GoogleCast/GoogleCast.h>
#import <React/RCTConvert.h>

@implementation RCTConvert (GCKAdBreakClipInfo)

//+ (GCKAdBreakClipInfo *)GCKAdBreakClipInfo:(id)json {
//  GCKAdBreakInfoBuilder *builder = [[GCKAdBreakInfoBuilder alloc] init];
////  GCKAdBreakClipInfo *info = [[GCKAdBreakClipInfo alloc] init];
//
//  // TODO use builder in 4.3.4
//
////  return info;
//  return [builder ]
//}

+ (id)fromGCKAdBreakClipInfo:(GCKAdBreakClipInfo *)info {
  return @{
    @"adBreakClipId" : info.adBreakClipID,
    @"duration" : @(info.duration),
    @"title" : info.title,
    @"clickThroughUrl" : info.clickThroughURL,
    @"contentUrl" : info.contentURL,
    @"mimeType" : info.mimeType,
    @"contentId" : info.contentID,
    @"posterUrl" : info.posterURL,
    @"whenSkippable" : @(info.whenSkippable),
    @"hlsSegmentFormat" :
        [RCTConvert fromGCKHLSSegmentFormat:info.hlsSegmentFormat],
    //    @"vastAdsRequest" : ,
    @"customData" : info.customData,
  };
}

@end
