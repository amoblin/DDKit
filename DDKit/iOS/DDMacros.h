//
//  DDMacros.h
//  iMarboo
//
//  Created by amoblin on 15/12/20.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#ifndef DDMacros_h
#define DDMacros_h

#define ARC_SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(SS_CLASSNAME)	\
+ (SS_CLASSNAME *)sharedInstance;

// @implementation
#define ARC_SYNTHESIZE_SINGLETON_FOR_CLASS(SS_CLASSNAME) \
+ (SS_CLASSNAME *)sharedInstance { \
static SS_CLASSNAME *_##SS_CLASSNAME##_sharedInstance = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_##SS_CLASSNAME##_sharedInstance = [[self alloc] init]; \
}); \
return _##SS_CLASSNAME##_sharedInstance; \
}

#ifdef DEBUG
#define DDPrint(format, ...) NSLog( @"%s:%d %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(format), ##__VA_ARGS__] )
#else
#define DDPrint(format, ...)
#endif

#define Local(key) NSLocalizedString(key, nil)

#define IOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define USER_DEFAULT      [NSUserDefaults standardUserDefaults]

#endif /* DDMacros_h */
