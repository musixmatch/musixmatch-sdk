/*
 * Musixmatch Node Client
 * @uses Swagger generated JavaScript client
 * @author Loreto Parisi (loreto at musixmatch dot com)
 * @see https://developer.musixmatch.com/documentation
 *  @copy 2016 Musixmatch Spa
*/
(function() {

// Command Line Arguments
var arguments = process.argv.slice(2);

var MusixmatchApi = require('../../build/javascript-client/src/index');

// uncomment this to publish from nom
//var MusixmatchApi = require('musixmatch_api');
var defaultClient = MusixmatchApi.ApiClient.instance;
var key = defaultClient.authentications['key'];

if ( typeof(arguments[0]) == 'undefined' ) {

    console.warn("Usage:\nnode musixmatch.js YOUR_API_KEY");
    process.exit(1);

}

key.apiKey = arguments[0]; // {String} 

var callback = (error, data, response, method) => {
    if (error) {
        console.error(error);
    } else if(response.text) {
        data = JSON.parse(response.text);
        console.log('API %s successfully. Returned data:\n%s' ,method,JSON.stringify(data,null,2));
    }
    else {
        throw new Error('bad response')   
    }
}
var opt;
var trackId, albumId, artistId;

//// tracks API ////
opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    page: 1, // {number}
    pageSize: 5,  // {number}
    country: 'us', // {String}
    fHasLyrics: 1 // {number}
};
(new MusixmatchApi.TrackApi()).chartTracksGetGet(opts, (error, data, response) => { 
        callback(error, data, response, "chartTracksGetGet") 
})

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    qArtist: "coldplay", // {String}
    qTrack: "viva la vida", // {String}
    fHasLyrics: 1, // {number}
    fHasSubtitle: 1 // {number}
};
(new MusixmatchApi.TrackApi()).matcherTrackGetGet(opts, (error, data, response) => {
    callback(error, data, response, "matcherTrackGetGet"); 
});

trackId= 15445219; // {number}
(new MusixmatchApi.TrackApi()).trackGetGet(trackId, opts, (error, data, response) => {
    callback(error, data, response, "trackGetGet"); 
} );

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    qArtist: "coldplay", // {String}
    qTrack: "viva la vida", // {String}
    //qLyrics : "", // {String}
    //fArtistId: 1039, // {number}
    //fMusicGenreId: 33, // {number}
    sArtistRating: 'desc', // {desc|asc}
    sTrackRating: 'desc', // {desc|asc}
    fHasLyrics: 1, // {number}
    fLyricsLanguage : 'en', // {String}
};
(new MusixmatchApi.TrackApi()).trackSearchGet(opts, (error, data, response) => {
    callback(error, data, response, "trackSearchGet"); 
} );

//// lyrics API ////
opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    qArtist: "coldplay", // {String}
    qTrack: "viva la vida" // {String}
};
(new MusixmatchApi.LyricsApi()).matcherLyricsGetGet(opts, (error, data, response) => {
    callback(error, data, response, "matcherLyricsGetGet"); 
});

trackId= 15445219; // {number}
(new MusixmatchApi.LyricsApi()).trackLyricsGetGet(trackId, opts, (error, data, response) => {
    callback(error, data, response, "trackLyricsGetGet"); 
});

//// snippet API ////
trackId= 16860631; // {number}
(new MusixmatchApi.SnippetApi()).trackSnippetGetGet(trackId, opts, (error, data, response) => {
    callback(error, data, response, "trackSnippetGetGet"); 
});

//// subtitles API ////
trackId= 16860631; // {number}
(new MusixmatchApi.SubtitleApi()).trackSubtitleGetGet(trackId, opts, (error, data, response) => {
    callback(error, data, response, "trackSubtitleGetGet"); 
});

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    qArtist: "coldplay", // {String}
    qTrack: "viva la vida", // {String}
    fSubtitleLength: 199, // {number}
    fSubtitleLengthMaxDeviation: 1 // {number}
};
(new MusixmatchApi.SubtitleApi()).matcherSubtitleGetGet(opts, (error, data, response) => {
    callback(error, data, response, "matcherSubtitleGetGet"); 
});

//// album api ////
albumId= 14250417; // {String}
(new MusixmatchApi.AlbumApi()).albumGetGet(albumId, opts, (error, data, response) => {
    callback(error, data, response, "albumGetGet"); 
});

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    page: 1, // {number}
    pageSize: 5,  // {number}
    fHasLyrics: 1 // {number}
};
(new MusixmatchApi.TrackApi()).albumTracksGetGet(albumId, opts, (error, data, response) => {
    callback(error, data, response, "albumTracksGetGet"); 
});

///// artist API ////
artistId= 1039; // {String}
opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    page: 1, // {number}
    pageSize: 5,  // {number}
    sReleaseDate: "desc", // {asc|desc} 
    gAlbumName: 1 // {number}
};
(new MusixmatchApi.AlbumApi()).artistAlbumsGetGet(artistId, opts, (error, data, response) => {
    callback(error, data, response, "artistAlbumsGetGet"); 
});

artistId= 1039; // {String}
(new MusixmatchApi.ArtistApi()).artistGetGet(artistId, opts, (error, data, response) => {
    callback(error, data, response, "artistGetGet"); 
});

artistId= 1039; // {String}
opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    age: 1, // {number}
    pageSize: 5  // {number}
};
(new MusixmatchApi.ArtistApi()).artistRelatedGetGet(artistId, opts, (error, data, response) => {
    callback(error, data, response, "artistRelatedGetGet"); 
});

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    qArtist: "coldplay", // {String}
    page: 1, // {number}
    pageSize: 5  // {number}
};
(new MusixmatchApi.ArtistApi()).artistSearchGet(opts, (error, data, response) => {
    callback(error, data, response, "artistSearchGet"); 
});

opts = {
    format: "json", // {String} output format: json, jsonp, xml.
    country: "jp", // {String}
    page: 1, // {number}
    pageSize: 5  // {number}
};
(new MusixmatchApi.ArtistApi()).chartArtistsGetGet(opts, (error, data, response) => {
    callback(error, data, response, "chartArtistsGetGet"); 
});

}).call(this);
