
#import "RNReactNativeImageLabel.h"
#import <React/RCTLog.h>

@implementation RNReactNativeImageLabel

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}


@end
  
