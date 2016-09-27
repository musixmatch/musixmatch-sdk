#import "SWGAlbumApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGInlineResponse200.h"
#import "SWGInlineResponse2002.h"


@interface SWGAlbumApi ()

@property (nonatomic, strong) NSMutableDictionary *defaultHeaders;

@end

@implementation SWGAlbumApi

NSString* kSWGAlbumApiErrorDomain = @"SWGAlbumApiErrorDomain";
NSInteger kSWGAlbumApiMissingParamErrorCode = 234513;

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
    static SWGAlbumApi *sharedAPI;
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
///  @returns SWGInlineResponse200*
///
-(NSNumber*) albumGetGetWithAlbumId: (NSString*) albumId
    format: (NSString*) format
    callback: (NSString*) callback
    completionHandler: (void (^)(SWGInlineResponse200* output, NSError* error)) handler {
    // verify the required parameter 'albumId' is set
    if (albumId == nil) {
        NSParameterAssert(albumId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"albumId"] };
            NSError* error = [NSError errorWithDomain:kSWGAlbumApiErrorDomain code:kSWGAlbumApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/album.get"];

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
                              responseType: @"SWGInlineResponse200*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse200*)data, error);
                                }
                           }
          ];
}

///
/// 
/// 
///  @param artistId The musiXmatch artist id 
///
///  @param format output format: json, jsonp, xml. (optional, default to json)
///
///  @param callback jsonp callback (optional)
///
///  @param sReleaseDate Sort by release date (asc|desc) (optional)
///
///  @param gAlbumName Group by Album Name (optional)
///
///  @param pageSize Define the page size for paginated results.Range is 1 to 100. (optional)
///
///  @param page Define the page number for paginated results (optional)
///
///  @returns SWGInlineResponse2002*
///
-(NSNumber*) artistAlbumsGetGetWithArtistId: (NSString*) artistId
    format: (NSString*) format
    callback: (NSString*) callback
    sReleaseDate: (NSString*) sReleaseDate
    gAlbumName: (NSString*) gAlbumName
    pageSize: (NSNumber*) pageSize
    page: (NSNumber*) page
    completionHandler: (void (^)(SWGInlineResponse2002* output, NSError* error)) handler {
    // verify the required parameter 'artistId' is set
    if (artistId == nil) {
        NSParameterAssert(artistId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"artistId"] };
            NSError* error = [NSError errorWithDomain:kSWGAlbumApiErrorDomain code:kSWGAlbumApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/artist.albums.get"];

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
    if (artistId != nil) {
        queryParams[@"artist_id"] = artistId;
    }
    if (sReleaseDate != nil) {
        queryParams[@"s_release_date"] = sReleaseDate;
    }
    if (gAlbumName != nil) {
        queryParams[@"g_album_name"] = gAlbumName;
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
                              responseType: @"SWGInlineResponse2002*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGInlineResponse2002*)data, error);
                                }
                           }
          ];
}



@end
