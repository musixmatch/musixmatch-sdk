#import "SWGLyrics.h"

@implementation SWGLyrics

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"instrumental": @"instrumental", @"pixel_tracking_url": @"pixelTrackingUrl", @"publisher_list": @"publisherList", @"lyrics_language_description": @"lyricsLanguageDescription", @"restricted": @"restricted", @"updated_time": @"updatedTime", @"explicit": @"explicit", @"lyrics_copyright": @"lyricsCopyright", @"html_tracking_url": @"htmlTrackingUrl", @"lyrics_language": @"lyricsLanguage", @"script_tracking_url": @"scriptTrackingUrl", @"verified": @"verified", @"lyrics_body": @"lyricsBody", @"lyrics_id": @"lyricsId", @"writer_list": @"writerList", @"can_edit": @"canEdit", @"action_requested": @"actionRequested", @"locked": @"locked" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"instrumental", @"pixelTrackingUrl", @"publisherList", @"lyricsLanguageDescription", @"restricted", @"updatedTime", @"explicit", @"lyricsCopyright", @"htmlTrackingUrl", @"lyricsLanguage", @"scriptTrackingUrl", @"verified", @"lyricsBody", @"lyricsId", @"writerList", @"canEdit", @"actionRequested", @"locked"];
  return [optionalProperties containsObject:propertyName];
}

@end
