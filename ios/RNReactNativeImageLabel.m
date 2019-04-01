
#import "RNReactNativeImageLabel.h"
#import <React/RCTLog.h>

@import Firebase;

@implementation RNReactNativeImageLabel

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


RCT_EXPORT_METHOD(addEvent:(NSString *)imagePath location:(NSString *)location)
{
    UIImage *uiImage = [UIImage imageWithContentsOfFile:imagePath];
    
    FIRVisionImage *image = [[FIRVisionImage alloc] initWithImage:uiImage];
    
    FIRVisionImageLabeler *labeler = [[FIRVision vision] onDeviceImageLabeler];

    [labeler processImage:image
               completion:^(NSArray<FIRVisionImageLabel *> *_Nullable labels,
                            NSError *_Nullable error) {
                   if (error != nil) { return; }
                   
                   
                   
                   // Task succeeded.
                   // ...
                   
                   for (FIRVisionImageLabel *label in labels) {
                       NSString *labelText = label.text;
                       NSString *entityId = label.entityID;
                       NSNumber *confidence = label.confidence;
                        RCTLogInfo(@"ML SHIT %@ at %@", labelText, entityId);
                   }
               }];

    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}


@end
  
