#import "SWGInlineResponse2005MessageHeader.h"

@implementation SWGInlineResponse2005MessageHeader

- (instancetype)init {
  self = [super init];
  if (self) {
    // initialize property's default value, if any
    
  }
  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"available": @"available", @"status_code": @"statusCode", @"execute_time": @"executeTime" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"available", @"statusCode", @"executeTime"];
  return [optionalProperties containsObject:propertyName];
}

@end
