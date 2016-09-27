#import "SWGSubtitle.h"

@implementation SWGSubtitle

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"subtitle_body": @"subtitleBody", @"publisher_list": @"publisherList", @"subtitle_language": @"subtitleLanguage", @"subtitle_language_description": @"subtitleLanguageDescription", @"subtitle_id": @"subtitleId", @"pixel_tracking_url": @"pixelTrackingUrl", @"html_tracking_url": @"htmlTrackingUrl", @"restricted": @"restricted", @"lyrics_copyright": @"lyricsCopyright", @"script_tracking_url": @"scriptTrackingUrl", @"subtitle_length": @"subtitleLength", @"updated_time": @"updatedTime", @"writer_list": @"writerList" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"subtitleBody", @"publisherList", @"subtitleLanguage", @"subtitleLanguageDescription", @"subtitleId", @"pixelTrackingUrl", @"htmlTrackingUrl", @"restricted", @"lyricsCopyright", @"scriptTrackingUrl", @"subtitleLength", @"updatedTime", @"writerList"];
  return [optionalProperties containsObject:propertyName];
}

@end
