## Swagger Musixmatch API SDK Clients
In this repository clients examples using the auto generated (codegen) SDK available in `dist/`.
```
├── SwaggerClient
│   ├── Droid
│   ├── SwaggerClient
│   ├── UITests
│   ├── iOS
│   └── packages
├── javascript
│   ├── css
│   └── js
├── node
├── perl
├── php
└── python
```

#### How to import the auto generated SDK
The auto generated sdk (codegen) are available as distribution for the latest swagger definition `swagger/swagger.yaml` in the `dist/` folder. These distribution must be unzipped in a `build/` folder and the can be used as-it-is in the clients, as showed below.
After unzipping the sdk the `build/` folder should look like this

```
├── android-client
│   ├── docs
│   ├── gradle
│   └── src
├── csharp-client
│   ├── bin
│   ├── docs
│   ├── packages
│   └── src
├── javascript-client
│   ├── docs
│   ├── src
│   └── test
├── objc-client
│   ├── SwaggerClient
│   └── docs
├── perl-client
│   ├── bin
│   ├── docs
│   ├── lib
│   └── t
├── php-client
│   └── SwaggerClient-php
└── python-client
    ├── build
    ├── dist
    ├── docs
    ├── swagger_client
    ├── swagger_client.egg-info
    └── test
```

The auto generated clients can be then referenced and imported in the project in the `client/` folder.

IMPORTANT NOTICE.
At this time only the `dist/javascript-client-patched.zip` is provided with as patch, that fixes a missing `JSONP` Ajax interface that would not work otherwise using the codegen `dist/javascript-client.zip` provided by Swagger. All the other sdk can ben unzipped and deployed as it is.

#### iOS and Android Client (SwaggerClient)
The `SwaggerClient` folder contains a `XamarinStudio` mobile application project using the C# sdk `dist/csharp-client-generated.zip`. The application has both the `iOS` and `Droid` iOS and Android `ARMv7` targets, sharing the code in a Shared Library project `SwaggerClient` between the two targets.

#### Node Client
The `node` client uses the `JavaScript` sdk in `dist/javascript-client-generated.zip`.
This is a server-side node client and makes use of the `require` module to include packages:

```javascript
var MusixmatchApi = require('../../build/javascript-client/src/index')
var defaultClient = MusixmatchApi.ApiClient.instance;
var key = defaultClient.authentications['key'];
key.apiKey = "YOUR_API_KEY"; // {String} 
var opts = {
    format: "json", // {String} output format: json, jsonp, xml.
};
trackId= 15445219; // {number}
(new MusixmatchApi.TrackApi()).trackGetGet(trackId, opts, (error, data, response) => {
    if (error) {
        console.error(error);
    } else if(response.text) {
        data = JSON.parse(response.text);
        console.log('Returned data:\n%s' ,JSON.stringify(data,null,2));
    }
    else {
        throw new Error('bad response')   
    }
} );
```

For the browser version see the next one.

#### JavaScript Client (Browser)
This client runs in the browser using the `dist/javascript-client-generated.zip`, and a bundle generated file through a packaging process:

```shell
browserify --s MusixmatchApi index.js -o ../../client/javascript/bundle.js
```

The sdk module will be therefore available in the client browser without any further library import:

```html
<script src="bundle.js"></script>
```javascript
var defaultClient = MusixmatchApi.ApiClient.instance;
var key = defaultClient.authentications['key'];
key.apiKey = "MY_API_KEY"; // {String}
//...
```

#### Perl
This perl client uses the library sdk `perl-client-generated.zip`. The library needs some modules to be installed via `cpan` that are the following

```perl
use MIME::Base64;
use LWP::UserAgent;
use HTTP::Headers;
use HTTP::Response;
use HTTP::Request::Common qw(DELETE POST GET HEAD PUT);
use HTTP::Status;
use URI::Query;
use JSON;
use URI::Escape;
use Scalar::Util;
use Log::Any qw($log);
use Carp;
```

Then the library module can be imported into the client

```perl
use lib "../../build/perl-client/lib";  # use the parent directory
use strict;
use warnings;
use Log::Any;
use Data::Dumper;
# load the API package
use WWW::SwaggerClient::AlbumApi;
use WWW::SwaggerClient::ArtistApi;
use WWW::SwaggerClient::LyricsApi;
use WWW::SwaggerClient::SnippetApi;
use WWW::SwaggerClient::SubtitleApi;
use WWW::SwaggerClient::TrackApi;
```

Due to a security issue, well described [here](https://github.com/swagger-api/swagger-codegen/issues/3505), you need to install the `Mozilla::CA` certificate authority as well:

```
$ sudo cpan
cpan[1]> install Mozilla::CA
```

and use it

```perl
use Mozilla::CA;
```

```perl
$WWW::SwaggerClient::Configuration::api_key->{'apikey'} = 'MY_API_KEY'
my $api_instance = WWW::SwaggerClient::AlbumApi->new();
my $album_id = '14250417'; # string | The musiXmatch album id
my $format = 'json'; # string | output format: json, jsonp, xml.
my $result = $api_instance->album_get_get(album_id => $album_id, format => $format);
print Dumper($result);
```

#### PHP
This php client uses the php library `dist/php-client-generated.zip` and it can be imported as `require_once('../../build/php-client/SwaggerClient-php/autoload.php');`

```php
Swagger\Client\Configuration::getDefaultConfiguration()->setApiKey('apikey', $argv[1]);
$api_instance = new Swagger\Client\Api\AlbumApi();
$album_id = "14250417"; // string | The musiXmatch album id
$format = "json"; // string | output format: json, jsonp, xml

try {
    $result = $api_instance->albumGetGet($album_id, $format);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling AlbumApi->albumGetGet: ', $e->getMessage(), PHP_EOL;
}
```
#### Python
The Python client import the sdk in `dist/python-client-generated.zip` and it can be used as the `swagger_client` named module once it has been installed into the system

```sh
python setup.py install --user
```
(or `sudo python setup.py install` to install the package for all users)

Then import the package:

```python
import swagger_client
from swagger_client.rest import ApiException
# str | Account api key, to be used in every api call
swagger_client.configuration.api_key['apikey'] = sys.argv[1]

# create an instance of the API class
api_instance = swagger_client.AlbumApi()
#...
```

### Objective-C (iOS)
The `Objective-C` client can be used to build `iOS`, `tvOS`, `watchOS`, `tvOS` and `macOS` targets. The client must use the `dist/objc-client-generated.zip` auto generated library unzipped as the `build/objc-client` folder.
The example iOS app `client/iOS/SwaggerClientApp` makes use of `Cocoapod` to pull the needed dependecies:

```
├── Musixmatch
│   ├── SwaggerClient
│   └── SwaggerClient.podspec
├── Podfile
├── Pods
├── SwaggerClientApp
├── SwaggerClientApp.xcodeproj
└── SwaggerClientApp.xcworkspace
```

The folder `Musixmatch/` contains the `SwaggerClient` library as local Pod. To install it and all the other remote `Pods` type from the project root:

```
pod install
```

The header file `SwaggerClient.h` contains all necessary headers, so you can import this header once in your application:

```objc
#import "SwaggerClient.h"
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    SWGConfiguration *apiConfig = [SWGConfiguration sharedConfig];
    // Configure API key authorization: (authentication scheme: key)
    [apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"apikey"];
    // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    //[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"apikey"];
    NSString *albumId = @"14250417"; // The musiXmatch album id
    NSString *format = @"json"; // output format: json, jsonp, xml. (optional) SWGAlbumApi *apiInstance = [[SWGAlbumApi alloc] init];
    [apiInstance albumGetGetWithAlbumId:albumId
                                 format:format
                               callback:nil
                      completionHandler: ^(SWGInlineResponse200* output, NSError* error) {
                          if (output) {
                              NSLog(@"%@", output);
                          }
                          if (error) {
                              NSLog(@"Error: %@", error);
                          }
                      }];
}
```

NOTE. This `Objective-C` library has been patched due to a unsupported `Content-Type` header, so that the response deserializer will accept the `text/plain` header. The patch is located at `dist/objc-client-patched.zip`

### CSharp client (Android, iOS app, x86 CLI)
The CSharp client can be used for the `iOS` and `Android` ARMv7 targets with `XamarinStudio` multiplatform development IDE. It can be also used for standard CSharp x86 CLI projects. The client must import the sdk in `dist/csharp-client-generated.zip`.

This sdk has two dependencies: `RESTSharp` and `NewtonSoft.JSON` packages available via `NuGet` package manager.
It can be then imported as

```csharp
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;
```

NOTE. Due to a SSL issue, the `CSharp/Android` example is not fully working at this time, while the `CSharp/iOS` is. See https://github.com/swagger-api/swagger-codegen/issues/3505 for more info about this.

### Java (Android)
The Java Android client can be used in ARMv7 / x86 Android app targets. The library must include the `dist/android-client-generated.zip` sdk library in the java library path. The deployed jar will be `target/swagger-android-client-1.0.0.jar`.
It can be the imported as 

```java
import io.swagger.client.api.DefaultApi;
```

### More to come
`Go`, `Ruby`.

