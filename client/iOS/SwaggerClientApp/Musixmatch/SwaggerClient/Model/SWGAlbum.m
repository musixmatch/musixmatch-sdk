#import "SWGAlbum.h"

@implementation SWGAlbum

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"album_coverart_500x500": @"albumCoverart500x500", @"restricted": @"restricted", @"artist_id": @"artistId", @"album_name": @"albumName", @"album_coverart_800x800": @"albumCoverart800x800", @"album_copyright": @"albumCopyright", @"album_coverart_350x350": @"albumCoverart350x350", @"artist_name": @"artistName", @"primary_genres": @"primaryGenres", @"album_id": @"albumId", @"album_rating": @"albumRating", @"album_pline": @"albumPline", @"album_track_count": @"albumTrackCount", @"album_release_type": @"albumReleaseType", @"album_release_date": @"albumReleaseDate", @"album_edit_url": @"albumEditUrl", @"updated_time": @"updatedTime", @"secondary_genres": @"secondaryGenres", @"album_mbid": @"albumMbid", @"album_vanity_id": @"albumVanityId", @"album_coverart_100x100": @"albumCoverart100x100", @"album_label": @"albumLabel" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"albumCoverart500x500", @"restricted", @"artistId", @"albumName", @"albumCoverart800x800", @"albumCopyright", @"albumCoverart350x350", @"artistName", @"primaryGenres", @"albumId", @"albumRating", @"albumPline", @"albumTrackCount", @"albumReleaseType", @"albumReleaseDate", @"albumEditUrl", @"updatedTime", @"secondaryGenres", @"albumMbid", @"albumVanityId", @"albumCoverart100x100", @"albumLabel"];
  return [optionalProperties containsObject:propertyName];
}

@end
