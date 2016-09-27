#import "SWGAlbumPrimaryGenresMusicGenre.h"

@implementation SWGAlbumPrimaryGenresMusicGenre

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"music_genre_name_extended": @"musicGenreNameExtended", @"music_genre_vanity": @"musicGenreVanity", @"music_genre_parent_id": @"musicGenreParentId", @"music_genre_id": @"musicGenreId", @"music_genre_name": @"musicGenreName" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName {

  NSArray *optionalProperties = @[@"musicGenreNameExtended", @"musicGenreVanity", @"musicGenreParentId", @"musicGenreId", @"musicGenreName"];
  return [optionalProperties containsObject:propertyName];
}

@end
