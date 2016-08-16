//
//  NSDictionary+DD.m
//  Pods
//
//  Created by amoblin on 16/7/26.
//
//

#import "NSDictionary+DD.h"

@implementation NSDictionary (DD)

-(void)safeSetValue:(id)i forKey:(NSString*)key;
{
    if (i != nil) {
        [self setValue:i forKey:key];
    }
}

@end
