#!/usr/bin/env python

#
# Musixmatch Python API client
# @author Loreto Parisi (loreto at musixmatch dot com)
# @see https://developer.musixmatch.com/documentation
# @copy 2016 Musixmatch Spa

import time
import sys

import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

if len(sys.argv) <= 1:
    print("\nUsage: python musixmatch.py YOUR_API_KEY")
    exit()

# str | Account api key, to be used in every api call
swagger_client.configuration.api_key['apikey'] = sys.argv[1]

# create an instance of the API class
api_instance = swagger_client.AlbumApi()
album_id = '14250417' # str | The musiXmatch album id
format = 'json' # str | output format: json, jsonp, xml. (optional) (default to json)

try:
    # 
    api_response = api_instance.album_get_get(album_id, format=format)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->album_get_get: %s\n" % e)
