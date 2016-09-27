#import "SWGArtist.h"

@implementation SWGArtist

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"artist_credits": @"artistCredits", @"artist_mbid": @"artistMbid", @"artist_name": @"artistName", @"secondary_genres": @"secondaryGenres", @"artist_alias_list": @"artistAliasList", @"artist_vanity_id": @"artistVanityId", @"restricted": @"restricted", @"artist_country": @"artistCountry", @"artist_comment": @"artistComment", @"artist_name_translation_list": @"artistNameTranslationList", @"artist_edit_url": @"artistEditUrl", @"artist_share_url": @"artistShareUrl", @"artist_id": @"artistId", @"updated_time": @"updatedTime", @"managed": @"managed", @"primary_genres": @"primaryGenres", @"artist_twitter_url": @"artistTwitterUrl", @"artist_rating": @"artistRating" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"artistCredits", @"artistMbid", @"artistName", @"secondaryGenres", @"artistAliasList", @"artistVanityId", @"restricted", @"artistCountry", @"artistComment", @"artistNameTranslationList", @"artistEditUrl", @"artistShareUrl", @"artistId", @"updatedTime", @"managed", @"primaryGenres", @"artistTwitterUrl", @"artistRating"];
  return [optionalProperties containsObject:propertyName];
}

@end
