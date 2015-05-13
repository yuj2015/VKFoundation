#import "VKSlider.h"

@class VKScrubber;

@protocol VKScrubberDelegate <NSObject>
@optional
- (void)scrubbingBegin;
- (void)scrubbingEnd;
@end

@interface VKScrubber : VKSlider

@property (nonatomic, weak) id <VKScrubberDelegate> delegate;

@end


