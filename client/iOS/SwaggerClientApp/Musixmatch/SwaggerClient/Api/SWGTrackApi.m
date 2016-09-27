#import "SWGTrackApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGInlineResponse2001.h"
#import "SWGInlineResponse2006.h"
#import "SWGInlineResponse2009.h"


@interface SWGTrackApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation SWGTrackApi

NSString* kSWGTrackApiErrorDomain = @"SWGTrackApiErrorDomain";
NSInteger kSWGTrackApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    self = [super init];
    if (self) {
        SWGConfiguration *config = [SWGConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SWGApiClient alloc] init];
        }
        _apiClient = config.apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+ (instancetype)sharedAPI {
    static SWGTrackApi *sharedAPI;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedAPI = [[self alloc] init];
    });
    return sharedAPI;
}

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.defaultHeaders[key];
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self setDefaultHeaderValue:value forKey:key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(NSUInteger) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// 
/// 
///  @param albumId The musiXmatch album id 
///
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @param fHasLyrics When set, filter only contents with lyrics (optional)
///
///  @param page Define the page number for paginated results (optional)
///
///  @param pageSize Define the page size for paginated results.Range is 1 to 100. (optional)
///
///  @returns SWGInlineResponse2001*
///
-(NSNumber*) albumTracksGetGetWithAlbumId: (NSString*) albumId
    format: (NSString*) format
    callback: (NSString*) callback
    fHasLyrics: (NSString*) fHasLyrics
    page: (NSNumber*) page
    pageSize: (NSNumber*) pageSize
    completionHandler: (void (^)(SWGInlineResponse2001* output, NSError* error)) handler {
    // verify the required parameter 'albumId' is set
    if (albumId == nil) {
        NSParameterAssert(albumId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"albumId"] };
            NSError* error = [NSError errorWithDomain:kSWGTrackApiErrorDomain code:kSWGTrackApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/album.tracks.get"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (callback != nil) {
        queryParams[@"callback"] = callback;
    }
    if (albumId != nil) {
        queryParams[@"album_id"] = albumId;
    }
    if (fHasLyrics != nil) {
        queryParams[@"f_has_lyrics"] = fHasLyrics;
    }
    if (page != nil) {
        queryParams[@"page"] = page;
    }
    if (pageSize != nil) {
        queryParams[@"page_size"] = pageSize;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGInlineResponse2001*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2001*)data, error);
                                }
                           }
          ];
}

///
/// 
/// 
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @param page Define the page number for paginated results (optional)
///
///  @param pageSize Define the page size for paginated results.Range is 1 to 100. (optional)
///
///  @param country A valid ISO 3166 country code (optional, default to us)
///
///  @param fHasLyrics When set, filter only contents with lyrics (optional)
///
///  @returns SWGInlineResponse2006*
///
-(NSNumber*) chartTracksGetGetWithFormat: (NSString*) format
    callback: (NSString*) callback
    page: (NSNumber*) page
    pageSize: (NSNumber*) pageSize
    country: (NSString*) country
    fHasLyrics: (NSString*) fHasLyrics
    completionHandler: (void (^)(SWGInlineResponse2006* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/chart.tracks.get"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (callback != nil) {
        queryParams[@"callback"] = callback;
    }
    if (page != nil) {
        queryParams[@"page"] = page;
    }
    if (pageSize != nil) {
        queryParams[@"page_size"] = pageSize;
    }
    if (country != nil) {
        queryParams[@"country"] = country;
    }
    if (fHasLyrics != nil) {
        queryParams[@"f_has_lyrics"] = fHasLyrics;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGInlineResponse2006*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2006*)data, error);
                                }
                           }
          ];
}

///
/// 
/// 
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @param qArtist The song artist (optional)
///
///  @param qTrack The song title (optional)
///
///  @param fHasLyrics When set, filter only contents with lyrics (optional)
///
///  @param fHasSubtitle When set, filter only contents with subtitles (optional)
///
///  @returns SWGInlineResponse2009*
///
-(NSNumber*) matcherTrackGetGetWithFormat: (NSString*) format
    callback: (NSString*) callback
    qArtist: (NSString*) qArtist
    qTrack: (NSString*) qTrack
    fHasLyrics: (NSNumber*) fHasLyrics
    fHasSubtitle: (NSNumber*) fHasSubtitle
    completionHandler: (void (^)(SWGInlineResponse2009* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/matcher.track.get"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (callback != nil) {
        queryParams[@"callback"] = callback;
    }
    if (qArtist != nil) {
        queryParams[@"q_artist"] = qArtist;
    }
    if (qTrack != nil) {
        queryParams[@"q_track"] = qTrack;
    }
    if (fHasLyrics != nil) {
        queryParams[@"f_has_lyrics"] = fHasLyrics;
    }
    if (fHasSubtitle != nil) {
        queryParams[@"f_has_subtitle"] = fHasSubtitle;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGInlineResponse2009*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2009*)data, error);
                                }
                           }
          ];
}

///
/// 
/// 
///  @param trackId The musiXmatch track id 
///
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @returns SWGInlineResponse2009*
///
-(NSNumber*) trackGetGetWithTrackId: (NSString*) trackId
    format: (NSString*) format
    callback: (NSString*) callback
    completionHandler: (void (^)(SWGInlineResponse2009* output, NSError* error)) handler {
    // verify the required parameter 'trackId' is set
    if (trackId == nil) {
        NSParameterAssert(trackId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"trackId"] };
            NSError* error = [NSError errorWithDomain:kSWGTrackApiErrorDomain code:kSWGTrackApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/track.get"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (callback != nil) {
        queryParams[@"callback"] = callback;
    }
    if (trackId != nil) {
        queryParams[@"track_id"] = trackId;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGInlineResponse2009*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2009*)data, error);
                                }
                           }
          ];
}

///
/// 
/// 
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @param qTrack The song title (optional)
///
///  @param qArtist The song artist (optional)
///
///  @param qLyrics Any word in the lyrics (optional)
///
///  @param fArtistId When set, filter by this artist id (optional)
///
///  @param fMusicGenreId When set, filter by this music category id (optional)
///
///  @param fLyricsLanguage Filter by the lyrics language (en,it,..) (optional)
///
///  @param fHasLyrics When set, filter only contents with lyrics (optional)
///
///  @param sArtistRating Sort by our popularity index for artists (asc|desc) (optional)
///
///  @param sTrackRating Sort by our popularity index for tracks (asc|desc) (optional)
///
///  @param quorumFactor Search only a part of the given query string.Allowed range is (0.1 – 0.9) (optional, default to 1)
///
///  @param pageSize Define the page size for paginated results.Range is 1 to 100. (optional)
///
///  @param page Define the page number for paginated results (optional)
///
///  @returns SWGInlineResponse2006*
///
-(NSNumber*) trackSearchGetWithFormat: (NSString*) format
    callback: (NSString*) callback
    qTrack: (NSString*) qTrack
    qArtist: (NSString*) qArtist
    qLyrics: (NSString*) qLyrics
    fArtistId: (NSNumber*) fArtistId
    fMusicGenreId: (NSNumber*) fMusicGenreId
    fLyricsLanguage: (NSNumber*) fLyricsLanguage
    fHasLyrics: (NSNumber*) fHasLyrics
    sArtistRating: (NSString*) sArtistRating
    sTrackRating: (NSString*) sTrackRating
    quorumFactor: (NSNumber*) quorumFactor
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(SWGInlineResponse2006* output, NSError* error)) handler {
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/track.search"];

    // remove format in URL if needed
    [resourcePath replaceOccurrencesOfString:@".{format}" withString:@".json" options:0 range:NSMakeRange(0,resourcePath.length)];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (format != nil) {
        queryParams[@"format"] = format;
    }
    if (callback != nil) {
        queryParams[@"callback"] = callback;
    }
    if (qTrack != nil) {
        queryParams[@"q_track"] = qTrack;
    }
    if (qArtist != nil) {
        queryParams[@"q_artist"] = qArtist;
    }
    if (qLyrics != nil) {
        queryParams[@"q_lyrics"] = qLyrics;
    }
    if (fArtistId != nil) {
        queryParams[@"f_artist_id"] = fArtistId;
    }
    if (fMusicGenreId != nil) {
        queryParams[@"f_music_genre_id"] = fMusicGenreId;
    }
    if (fLyricsLanguage != nil) {
        queryParams[@"f_lyrics_language"] = fLyricsLanguage;
    }
    if (fHasLyrics != nil) {
        queryParams[@"f_has_lyrics"] = fHasLyrics;
    }
    if (sArtistRating != nil) {
        queryParams[@"s_artist_rating"] = sArtistRating;
    }
    if (sTrackRating != nil) {
        queryParams[@"s_track_rating"] = sTrackRating;
    }
    if (quorumFactor != nil) {
        queryParams[@"quorum_factor"] = quorumFactor;
    }
    if (pageSize != nil) {
        queryParams[@"page_size"] = pageSize;
    }
    if (page != nil) {
        queryParams[@"page"] = page;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"application/json"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"key"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGInlineResponse2006*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2006*)data, error);
                                }
                           }
          ];
}



@end
