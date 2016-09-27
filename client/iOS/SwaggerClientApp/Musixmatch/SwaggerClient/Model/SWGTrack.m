#import "SWGTrack.h"

@implementation SWGTrack

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"instrumental": @"instrumental", @"album_coverart_350x350": @"albumCoverart350x350", @"first_release_date": @"firstReleaseDate", @"track_isrc": @"trackIsrc", @"explicit": @"explicit", @"track_edit_url": @"trackEditUrl", @"num_favourite": @"numFavourite", @"album_coverart_500x500": @"albumCoverart500x500", @"album_name": @"albumName", @"track_rating": @"trackRating", @"track_share_url": @"trackShareUrl", @"track_soundcloud_id": @"trackSoundcloudId", @"artist_name": @"artistName", @"album_coverart_800x800": @"albumCoverart800x800", @"album_coverart_100x100": @"albumCoverart100x100", @"track_name_translation_list": @"trackNameTranslationList", @"track_name": @"trackName", @"restricted": @"restricted", @"has_subtitles": @"hasSubtitles", @"updated_time": @"updatedTime", @"subtitle_id": @"subtitleId", @"lyrics_id": @"lyricsId", @"track_spotify_id": @"trackSpotifyId", @"has_lyrics": @"hasLyrics", @"artist_id": @"artistId", @"album_id": @"albumId", @"artist_mbid": @"artistMbid", @"secondary_genres": @"secondaryGenres", @"commontrack_vanity_id": @"commontrackVanityId", @"track_id": @"trackId", @"track_xboxmusic_id": @"trackXboxmusicId", @"primary_genres": @"primaryGenres", @"track_length": @"trackLength", @"track_mbid": @"trackMbid", @"commontrack_id": @"commontrackId" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"instrumental", @"albumCoverart350x350", @"firstReleaseDate", @"trackIsrc", @"explicit", @"trackEditUrl", @"numFavourite", @"albumCoverart500x500", @"albumName", @"trackRating", @"trackShareUrl", @"trackSoundcloudId", @"artistName", @"albumCoverart800x800", @"albumCoverart100x100", @"trackNameTranslationList", @"trackName", @"restricted", @"hasSubtitles", @"updatedTime", @"subtitleId", @"lyricsId", @"trackSpotifyId", @"hasLyrics", @"artistId", @"albumId", @"artistMbid", @"secondaryGenres", @"commontrackVanityId", @"trackId", @"trackXboxmusicId", @"primaryGenres", @"trackLength", @"trackMbid", @"commontrackId"];
  return [optionalProperties containsObject:propertyName];
}

@end
