#import "SWGSnippet.h"

@implementation SWGSnippet

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"html_tracking_url": @"htmlTrackingUrl", @"instrumental": @"instrumental", @"restricted": @"restricted", @"updated_time": @"updatedTime", @"snippet_body": @"snippetBody", @"pixel_tracking_url": @"pixelTrackingUrl", @"snippet_id": @"snippetId", @"script_tracking_url": @"scriptTrackingUrl", @"snippet_language": @"snippetLanguage" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"htmlTrackingUrl", @"instrumental", @"restricted", @"updatedTime", @"snippetBody", @"pixelTrackingUrl", @"snippetId", @"scriptTrackingUrl", @"snippetLanguage"];
  return [optionalProperties containsObject:propertyName];
}

@end
