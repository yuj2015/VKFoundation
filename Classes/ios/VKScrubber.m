#import "VKScrubber.h"

@interface VKScrubber ()
@property (nonatomic, strong) UIImageView *scrubberGlow;
@end

@implementation VKScrubber

@synthesize delegate = _delegate;

- (void) initialize {

  [self setMaximumTrackImage:[[UIImage imageNamed:@"VKScrubber_max"]
      resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)]
      forState:UIControlStateNormal];
  [self setMinimumTrackImage:[[UIImage imageNamed:@"VKScrubber_min"]
      resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)]
      forState:UIControlStateNormal];
  [self setThumbImage:[UIImage imageNamed:@"VKScrubber_thumb"]
      forState:UIControlStateNormal];
  
  [self addTarget:self action:@selector(scrubbingBegin) forControlEvents:UIControlEventTouchDown];
  [self addTarget:self action:@selector(scrubbingEnd) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside|UIControlEventTouchCancel];
  [self addTarget:self action:@selector(scrubberValueChanged) forControlEvents:UIControlEventValueChanged];
  
  self.exclusiveTouch = YES;
}

- (void)scrubbingBegin {
  [self.delegate scrubbingBegin];
}

- (void)scrubbingDidEnd {
  [self.delegate scrubbingEnd:self];
}

- (void)scrubberValueChanged {
}


//- (void)setValue:(float)value animated:(BOOL)animated {
//  [super setValue:value animated:animated];
//  [self sendActionsForControlEvents:UIControlEventValueChanged];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGRect t = [self trackRectForBounds: [self bounds]];
    float v = [self minimumValue] + ([[touches anyObject] locationInView: self].x - t.origin.x - 4.0) * (([self maximumValue]-[self minimumValue]) / (t.size.width - 8.0));
    [self setValue: v];
    [super touchesBegan: touches withEvent: event];
}

@end
