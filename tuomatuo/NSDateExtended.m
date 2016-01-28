#import "NSDateExtended.h"

@implementation NSDate(NTLNExtended) 

- (NSString*)descriptionWithTwitterStyle {
	time_t now = [[NSDate date] timeIntervalSince1970]; // 这里的time_t是long类型
	time_t t = [self timeIntervalSince1970];
	
	int d = now - t;
	
	if (d < 5) {
		return @"less than 5 seconds ago";
	} else if (d < 10) {
		return @"less than 10 seconds ago";
	} else if (d < 15) {
		return @"less than 15 seconds ago";
	} else if (d < 20) {
		return @"less than 20 seconds ago";
	} else if (d < 30) {
		return @"half a minute ago";
	} else if (d < 60) {
		return @"less than a minute ago";
	} else if (d < 45*60 ) {
		return [NSString stringWithFormat:@"about %d minute ago", d/60];
	} else if (d < 24*60*60) {
		int h = d/3600;
		if (h < 1) h = 1;
		return [NSString stringWithFormat:@"about %d hour ago",h];
	}
	
	char tmp[80];
	struct tm *tm_ = localtime(&t); // 把一个长量的指针传给一个结构体
	strftime(tmp, sizeof(tmp), "%I:%M %p %b %dth", tm_);
	return [NSString stringWithUTF8String:tmp];
}

- (NSString *)descriptionWithLeftStyle{
    time_t now = [[NSDate date] timeIntervalSince1970];
    time_t t = [self timeIntervalSince1970];
    
    long d = t - now;
    
    if (d > 60*60*24) {
        return [NSString stringWithFormat:@"%li天以上", d/(60*60*24)];
    }else{
        return [NSString stringWithFormat:@"%li小时%li分钟",d/(60*60),(d-(d/(60*60))*60*60)/60];
    }
}

- (NSString*)descriptionWithNTLNStyle {
	time_t now = [[NSDate date] timeIntervalSince1970];
	time_t t = [self timeIntervalSince1970];
	struct tm *tm_ = localtime(&t);
	char tmp[80];
	
	long d = now - t;

	if (d < 24*60*60) {
		strftime(tmp, sizeof(tmp), "%I:%M %p", tm_);
	} else {
		strftime(tmp, sizeof(tmp), "%b %dth", tm_);
	}
	return [NSString stringWithUTF8String:tmp];
}

- (NSString*)descriptionWithRateLimitRemaining {
	time_t now = [[NSDate date] timeIntervalSince1970];
	time_t t = [self timeIntervalSince1970];
	
	long d = t - now;
	
	if (d < 0) {
		return @"soon";
	} else if (d < 60) {
		return [NSString stringWithFormat:@"about %ld second", d];
	} else if (d < 60*60) {
		return [NSString stringWithFormat:@"about %ld minute", d/60];
	} else if (d < 24*60*60) {
		return [NSString stringWithFormat:@"about %ld hour",d/3600];
	}
	
	char tmp[80];
	struct tm *tm_ = localtime(&t);
	strftime(tmp, sizeof(tmp), "%I:%M %p %b %dth", tm_);
	return [NSString stringWithUTF8String:tmp];
}

//  format  yyyy-MM-dd
- (NSString*)descriptionWithStyleOne{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:self];
}

//  format  yyyy-MM-dd
- (NSString*)descriptionWithStyle:(NSString *)formatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

//  format yyyy-MM-dd next day
- (NSString*)descriptionWithStyleOneNextDay{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  //  self.date
    return nil;
}

- (NSNumber *)getMillisecondFromNow{
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    return [NSNumber numberWithLongLong:(long long)(timeInterval*1000)];
}


@end
