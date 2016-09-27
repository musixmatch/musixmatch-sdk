<?php

/*
*  Musixmatch Perl API client
* @author Loreto Parisi (loreto at musixmatch dot com)
* @see https://developer.musixmatch.com/documentation
* @copy 2016 Musixmatch Spa
*/

require_once('../../build/php-client/SwaggerClient-php/autoload.php');

if( $argv[1] == '') {
    print 'Usage:$ php musixmatch.php YOUR_API_KEY';
    exit(0);
}

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

?>
