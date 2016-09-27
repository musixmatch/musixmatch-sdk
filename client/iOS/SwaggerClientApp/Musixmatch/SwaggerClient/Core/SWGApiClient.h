#import <Foundation/Foundation.h>
#import <ISO8601/ISO8601.h>
#import <AFNetworking/AFNetworking.h>
#import "SWGJSONResponseSerializer.h"
#import "SWGJSONRequestSerializer.h"
#import "SWGQueryParamCollection.h"
#import "SWGConfiguration.h"
#import "SWGResponseDeserializer.h"
#import "SWGSanitizer.h"
#import "SWGLogger.h"

/**
* Musixmatch API
* Musixmatch lyrics API is a robust service that permits you to search and retrieve lyrics in the simplest possible way. It just works.  Include millions of licensed lyrics on your website or in your application legally.  The fastest, most powerful and legal way to display lyrics on your website or in your application.  #### Read musixmatch API Terms & Conditions and the Privacy Policy: Before getting started, you must take a look at the [API Terms & Conditions](http://musixmatch.com/apiterms/) and the [Privacy Policy](https://developer.musixmatch.com/privacy). We’ve worked hard to make this service completely legal so that we are all protected from any foreseeable liability. Take the time to read this stuff.  #### Register for an API key: All you need to do is [register](https://developer.musixmatch.com/signup) in order to get your API key, a mandatory parameter for most of our API calls. It’s your personal identifier and should be kept secret:  ```   https://api.musixmatch.com/ws/v1.1/track.get?apikey=YOUR_API_KEY ``` #### Integrate the musixmatch service with your web site or application In the most common scenario you only need to implement two API calls:  The first call is to match your catalog to ours using the [track.search](#!/Track/get_track_search) function and the second is to get the lyrics using the [track.lyrics.get](#!/Lyrics/get_track_lyrics_get) api. That’s it!  ## API Methods What does the musiXmatch API do?  The musiXmatch API allows you to read objects from our huge 100% licensed lyrics database.  To make your life easier we are providing you with one or more examples to show you how it could work in the wild. You’ll find both the API request and API response in all the available output formats for each API call. Follow the links below for the details.  The current API version is 1.1, the root URL is located at https://api.musixmatch.com/ws/1.1/  Supported input parameters can be found on the page [Input Parameters](https://developer.musixmatch.com/documentation/input-parameters). Use UTF-8 to encode arguments when calling API methods.  Every response includes a status_code. A list of all status codes can be consulted at [Status Codes](https://developer.musixmatch.com/documentation/status-codes).  ## Music meta data The musiXmatch api is built around lyrics, but there are many other data we provide through the api that can be used to improve every existent music service.  ## Track Inside the track object you can get the following extra information:  ### TRACK RATING  The track rating is a score 0-100 identifying how popular is a song in musixmatch.  You can use this information to sort search results, like the most popular songs of an artist, of a music genre, of a lyrics language.  ### INSTRUMENTAL AND EXPLICIT FLAGS  The instrumental flag identifies songs with music only, no lyrics.  The explicit flag identifies songs with explicit lyrics or explicit title. We're able to identify explicit words and set the flag for the most common languages.  ### FAVOURITES  How many users have this song in their list of favourites.  Can be used to sort tracks by num favourite to identify more popular tracks within a set.  ### MUSIC GENRE  The music genere of the song.  Can be used to group songs by genre, as input for similarity alghorithms, artist genre identification, navigate songs by genere, etc.  ### SONG TITLES TRANSLATIONS  The track title, as translated in different lanauages, can be used to display the right writing for a given user, example:  LIES (Bigbang) becomes 在光化門 in chinese HALLELUJAH (Bigbang) becomes ハレルヤ in japanese   ## Artist Inside the artist object you can get the following nice extra information:  ### COMMENTS AND COUNTRY  An artist comment is a short snippet of text which can be mainly used for disambiguation.  The artist country is the born country of the artist/group  There are two perfect search result if you search by artist with the keyword \"U2\". Indeed there are two distinct music groups with this same name, one is the most known irish group of Bono Vox, the other is a less popular (world wide speaking) group from Japan.  Here's how you can made use of the artist comment in your search result page:  U2 (Irish rock band) U2 (あきやまうに) You can also show the artist country for even better disambiguation:  U2 (Irish rock band) from Ireland U2 (あきやまうに) from Japan ARTIST TRANSLATIONS  When you create a world wide music related service you have to take into consideration to display the artist name in the user's local language. These translation are also used as aliases to improve the search results.  Let's use PSY for this example.  Western people know him as PSY but korean want to see the original name 싸이.  Using the name translations provided by our api you can show to every user the writing they expect to see.  Furthermore, when you search for \"psy gangnam style\" or \"싸이 gangnam style\" with our search/match api you will still be able to find the song.  ### ARTIST RATING  The artist rating is a score 0-100 identifying how popular is an artist in musixmatch.  You can use this information to build charts, for suggestions, to sort search results. In the example above about U2, we use the artist rating to show the irish band before the japanese one in our serp.  ### ARTIST MUSIC GENRE  We provide one or more main artist genre, this information can be used to calculate similar artist, suggestions, or the filter a search by artist genre.    ## Album Inside the album object you can get the following nice extra information:  ### ALBUM RATING  The album rating is a score 0-100 identifying how popular is an album in musixmatch.  You can use this information to sort search results, like the most popular albums of an artist.  ### ALBUM RATING  The album rating is a score 0-100 identifying how popular is an album in musixmatch.  You can use this information to sort search results, like the most popular albums of an artist.  ### ALBUM COPYRIGHT AND LABEL  For most of our albums we can provide extra information like for example:  Label: Universal-Island Records Ltd. Copyright: (P) 2013 Rubyworks, under license to Columbia Records, a Division of Sony Music Entertainment. ALBUM TYPE AND RELEASE DATE  The album official release date can be used to sort an artist's albums view starting by the most recent one.  Album can also be filtered or grouped by type: Single, Album, Compilation, Remix, Live. This can help to build an artist page with a more organized structure.  ### ALBUM MUSIC GENRE  For most of the albums we provide two groups of music genres. Primary and secondary. This information can be used to help user navigate albums by genre.  An example could be:  Primary genere: POP Secondary genre: K-POP or Mandopop 
*
* OpenAPI spec version: 1.1.0
* Contact: info@musixmatch.com
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#import "SWGAlbum.h"
#import "SWGAlbumPrimaryGenres.h"
#import "SWGAlbumPrimaryGenresMusicGenre.h"
#import "SWGAlbumPrimaryGenresMusicGenreList.h"
#import "SWGArtist.h"
#import "SWGArtistArtistAliasList.h"
#import "SWGArtistArtistCredits.h"
#import "SWGArtistArtistNameTranslation.h"
#import "SWGArtistArtistNameTranslationList.h"
#import "SWGArtistPrimaryGenres.h"
#import "SWGArtistPrimaryGenresMusicGenre.h"
#import "SWGArtistPrimaryGenresMusicGenreList.h"
#import "SWGArtistSecondaryGenres.h"
#import "SWGInlineResponse200.h"
#import "SWGInlineResponse2001.h"
#import "SWGInlineResponse20010.h"
#import "SWGInlineResponse20010Message.h"
#import "SWGInlineResponse20010MessageBody.h"
#import "SWGInlineResponse2001Message.h"
#import "SWGInlineResponse2001MessageBody.h"
#import "SWGInlineResponse2001MessageHeader.h"
#import "SWGInlineResponse2002.h"
#import "SWGInlineResponse2002Message.h"
#import "SWGInlineResponse2002MessageBody.h"
#import "SWGInlineResponse2002MessageHeader.h"
#import "SWGInlineResponse2003.h"
#import "SWGInlineResponse2003Message.h"
#import "SWGInlineResponse2003MessageBody.h"
#import "SWGInlineResponse2004.h"
#import "SWGInlineResponse2004Message.h"
#import "SWGInlineResponse2004MessageBody.h"
#import "SWGInlineResponse2005.h"
#import "SWGInlineResponse2005Message.h"
#import "SWGInlineResponse2005MessageHeader.h"
#import "SWGInlineResponse2006.h"
#import "SWGInlineResponse2006Message.h"
#import "SWGInlineResponse2006MessageBody.h"
#import "SWGInlineResponse2006MessageBodyTrackList.h"
#import "SWGInlineResponse2007.h"
#import "SWGInlineResponse2007Message.h"
#import "SWGInlineResponse2007MessageBody.h"
#import "SWGInlineResponse2008.h"
#import "SWGInlineResponse2008Message.h"
#import "SWGInlineResponse2008MessageBody.h"
#import "SWGInlineResponse2009.h"
#import "SWGInlineResponse2009Message.h"
#import "SWGInlineResponse200Message.h"
#import "SWGInlineResponse200MessageBody.h"
#import "SWGInlineResponse200MessageHeader.h"
#import "SWGLyrics.h"
#import "SWGSnippet.h"
#import "SWGSubtitle.h"
#import "SWGTrack.h"
#import "SWGTrackPrimaryGenres.h"
#import "SWGTrackPrimaryGenresMusicGenre.h"
#import "SWGTrackPrimaryGenresMusicGenreList.h"
#import "SWGTrackSecondaryGenres.h"
#import "SWGTrackSecondaryGenresMusicGenre.h"
#import "SWGTrackSecondaryGenresMusicGenreList.h"



@class SWGConfiguration;

/**
 * A key for `NSError` user info dictionaries.
 *
 * The corresponding value is the parsed response body for an HTTP error.
 */
extern NSString *const SWGResponseObjectErrorKey;

@interface SWGApiClient : AFHTTPSessionManager

@property(nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property(nonatomic, assign) NSTimeInterval timeoutInterval;
@property(nonatomic, readonly) NSOperationQueue* queue;

/// In order to ensure the HTTPResponseHeaders are correct, it is recommended to initialize one SWGApiClient instance per thread.
@property(nonatomic, readonly) NSDictionary* HTTPResponseHeaders;

@property(nonatomic, strong) id<SWGResponseDeserializer> responseDeserializer;

@property(nonatomic, strong) id<SWGSanitizer> sanitizer;
/**
 * Clears Cache
 */
+(void)clearCache;

/**
 * Turns on cache
 *
 * @param enabled If the cached is enable, must be `YES` or `NO`
 */
+(void)setCacheEnabled:(BOOL) enabled;

/**
 * Gets the request queue size
 *
 * @return The size of `queuedRequests` static variable.
 */
+(NSUInteger)requestQueueSize;

/**
 * Sets the client unreachable
 *
 * @param state off line state, must be `YES` or `NO`
 */
+(void) setOfflineState:(BOOL) state;

/**
 * Gets if the client is unreachable
 *
 * @return The client offline state
 */
+(BOOL) getOfflineState;

/**
 * Sets the client reachability, this may be overridden by the reachability manager if reachability changes
 *
 * @param The client reachability.
 */
+(void) setReachabilityStatus:(AFNetworkReachabilityStatus) status;

/**
 * Gets the client reachability
 *
 * @return The client reachability.
 */
+(AFNetworkReachabilityStatus) getReachabilityStatus;

/**
 * Gets the next request id
 *
 * @return The next executed request id.
 */
+(NSNumber*) nextRequestId;

/**
 * Generates request id and add it to the queue
 *
 * @return The next executed request id.
 */
+(NSNumber*) queueRequest;

/**
 * Removes request id from the queue
 *
 * @param requestId The request which will be removed.
 */
+(void) cancelRequest:(NSNumber*)requestId;

/**
 * Customizes the behavior when the reachability changed
 *
 * @param changeBlock The block will be executed when the reachability changed.
 */
+(void) setReachabilityChangeBlock:(void(^)(int))changeBlock;

/**
 * Sets the api client reachability strategy
 */
- (void)configureCacheReachibility;

/**
 * Sets header for request
 *
 * @param value The header value
 * @param forKey The header key
 */
-(void)setHeaderValue:(NSString*) value
               forKey:(NSString*) forKey;

/**
 * Updates header parameters and query parameters for authentication
 *
 * @param headers The header parameter will be udpated, passed by pointer to pointer.
 * @param querys The query parameters will be updated, passed by pointer to pointer.
 * @param authSettings The authentication names NSArray.
 */
- (void) updateHeaderParams:(NSDictionary **)headers
                queryParams:(NSDictionary **)querys
           WithAuthSettings:(NSArray *)authSettings;

/**
 * Performs request
 *
 * @param path Request url.
 * @param method Request method.
 * @param pathParams Request path parameters.
 * @param queryParams Request query parameters.
 * @param body Request body.
 * @param headerParams Request header parameters.
 * @param authSettings Request authentication names.
 * @param requestContentType Request content-type.
 * @param responseContentType Response content-type.
 * @param completionBlock The block will be executed when the request completed.
 *
 * @return The request id.
 */
-(NSNumber*) requestWithPath:(NSString*) path
                      method:(NSString*) method
                  pathParams:(NSDictionary *) pathParams
                 queryParams:(NSDictionary*) queryParams
                  formParams:(NSDictionary *) formParams
                       files:(NSDictionary *) files
                        body:(id) body
                headerParams:(NSDictionary*) headerParams
                authSettings:(NSArray *) authSettings
          requestContentType:(NSString*) requestContentType
         responseContentType:(NSString*) responseContentType
                responseType:(NSString *) responseType
             completionBlock:(void (^)(id, NSError *))completionBlock;

/**
 * Custom security policy
 *
 * @return AFSecurityPolicy
 */
- (AFSecurityPolicy *) customSecurityPolicy;

/**
 * SWGConfiguration return sharedConfig
 *
 * @return SWGConfiguration
 */
- (SWGConfiguration*) configuration;


@end
