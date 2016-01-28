#import <Foundation/Foundation.h>

@interface NSDate(NTLNExtended) // 这里是分类的运用

- (NSString*)descriptionWithTwitterStyle;
- (NSString *)descriptionWithLeftStyle;
- (NSString*)descriptionWithNTLNStyle;
- (NSString*)descriptionWithRateLimitRemaining;
- (NSString*)descriptionWithStyleOne;// yyyy-MM-dd
- (NSString*)descriptionWithStyle:(NSString *)formatter; // 用这个已经足够了
- (NSNumber *)getMillisecondFromNow;

@end

