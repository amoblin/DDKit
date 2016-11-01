//
//  DDBaseModel.m
//  iMarboo
//
//  Created by amoblin on 15/11/25.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDBaseModel.h"
//#import "DDMacros.h"
#define kNetCodeSuccess          0         // 成功

@implementation DDBaseModel

+ (JSONKeyMapper *)keyMapper;
{
    JSONKeyMapper *keeper = [JSONKeyMapper mapperForSnakeCase];
    return [[JSONKeyMapper alloc] initWithModelToJSONBlock:^NSString *(NSString *keyName) {
        for (NSString *key in [[self customKeyMapper] allKeys]) {
            if ([keyName isEqualToString:[[self customKeyMapper] objectForKey:key]]) {
                return key;
            }
        }
        return keeper.modelToJSONKeyBlock(keyName);
    }];
    /*
    return [[JSONKeyMapper alloc] initWithJSONToModelBlock:^NSString *(NSString *keyName) {
        if ([[self customKeyMapper] objectForKey:keyName]) {
            return [[self customKeyMapper] objectForKey:keyName];
        }
        return keeper.JSONToModelKeyBlock(keyName);
    } modelToJSONBlock:^NSString *(NSString *keyName) {
    }];
     */
}

+ (NSDictionary *)customKeyMapper;
{
    return @{@"id": @"identity"};
}


- (id)valueForUndefinedKey:(NSString *)key;
{
    return @"";
}

- (void)updateWithModel:(DDBaseModel *)model;
{
    // do nothing
}

- (void)updateWithDictionary:(NSDictionary *)dict;
{
    NSError *error = nil;
    DDBaseModel *model = nil;
    @try {
        model = [[[self class] alloc] initWithDictionary:dict error:&error];
    } @catch (NSException *exception) {
//        DDLog(@"%@", exception);
    } @finally {
    }
    [self updateWithModel:model];
}

+ (BOOL)propertyIsOptional:(NSString*)propertyName;
{
    return YES;
}

- (BOOL)isValid;
{
    return (self.errCode == kNetCodeSuccess);
}

- (NSString *)errMessage;
{
    return @"";
}

@end
