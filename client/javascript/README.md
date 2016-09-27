### Musixmatch Swagger JavaScript Client
Example of a auto generated swagger javascript client for Musixmatch API Swagger definition.

#### How to use the Swagger Client api
You have to browsify the client to be used in the browser:

```shell
cd ./build/javascript-client/src
browserify --s MusixmatchApi index.js -o ../../../client/javascript/bundle.js 
```

The option `--s` will export the module `MusixmatchApi` in the browser document window.

Then just import the bundle in the `html` page:

```html
<script src="bundle.js"></script>
```

and use the client as you would do in javascript

```javascript
var defaultClient = MusixmatchApi.ApiClient.instance;
var key = defaultClient.authentications['key'];
key.apiKey = "MY_API_KEY"; // {String}

var albumId= 14250417; // {String}
var opts = { 
    'format': "jsonp", // {String} output format: json, jsonp, xml.
    'callback': "callback" // {String} jsonp callback
};

var callback = function(error, data, response) {
    if (error) {
        console.error(error);
    } else {
        console.log('API called successfully. Returned data:' ,JSON.stringify(data,null,2));
    }
};
(new MusixmatchApi.AlbumApi()).albumGetGet(albumId, opts, (error, data, response) => {
    callback(error, data, response, "albumGetGet"); 
});
```

#### Notes
This client uses `jsonp` that it is not enabled by defaults in Swagger api, so it has a modified version of the client code that add support for `jsonp`.

#### The client page
This html client uses a `json` to `html` prettify in order to visualize the api response directly in the html page:

```javascript
var t = $('<div>').inneText=method;
var el=$('<div>');
$('#console').append(t).append(el);
var node = new PrettyJSON.view.Node({
    el:el,
    data:data
});
```

#### How to run the JavaScript API Playground
To run the API Playground test, you can use a local server doing

```shell
$ cd client/javascript
$ python -m SimpleHTTPServer 8181
```

and then point you browser to [http://localhost:8181](http://localhost:8181).

The browser will execute the client and SDK code, to test the api calls, as showed in the screenshot.


![JavaScript API Playground](https://cloud.githubusercontent.com/assets/163333/18639555/aa8d183c-7e94-11e6-8a2b-3eb680f57e7b.jpg)

You have to first set the Api Key. Please request one [here](https://developer.musixmatch.com/mmplans).


![Set Api Key](https://cloud.githubusercontent.com/assets/163333/18639539/9ab139fc-7e94-11e6-9895-51ba1590cb37.jpg)

You then click `Run` button. The api will be executed and the results will be shown as json in the Console tab.
Here you can press `Expand All` to expand all items of the json response, or `Collapse All` to collapse all expanded nodes.


![Api Console](https://cloud.githubusercontent.com/assets/163333/18639570/b3cea17c-7e94-11e6-8fc2-cf29d0389e2f.jpg)
