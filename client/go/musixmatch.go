/*
 * Musixmatch Go Client
 * @uses Swagger generated JavaScript client
 * @author Loreto Parisi (loreto at musixmatch dot com)
 * @see https://developer.musixmatch.com/documentation
 *  @copy 2016 Musixmatch Spa
*/
package main

import (
    "fmt"
    "bytes"
    "encoding/json"
    "./swagger"
    "io"
    "io/ioutil"
    "os"
)

func jsonPrettyPrint(in string) string {
    var out bytes.Buffer
    err := json.Indent(&out, []byte(in), "", "\t")
    if err != nil {
        return in
    }
    return out.String()
}
func main() {

    fmt.Println("Musixmatch Go Client")
    
    albumApi := swagger.NewAlbumApi()

    configuration := albumApi.Configuration
    configuration.SetDebug(true)
    configuration.APIKey["apikey"] = "YOUR_API_KEY"

    var albumId = "14250417"
    jsonResponse, response, _  := albumApi.AlbumGetGet(albumId,"json","")

    // read http.response
    defer response.Body.Close()

    // LP: to avoid memory leak limit memory read is a good practise in Golang
    // @see http://stackoverflow.com/questions/23967638/ioutil-readallresponse-body-blocks-forever-golang
    // @see https://socketloop.com/references/golang-io-limitreader-function-example
    htmlData, err := ioutil.ReadAll(io.LimitReader(response.Body, 2048))
    //err = json.NewDecoder(io.LimitReader(response.Body, 2048)).Decode(&response)

    /*
     * @see https://www.socketloop.com/tutorials/golang-convert-http-response-body-to-string
    LP: err = http: read on closed response body
    if err != nil {
 		fmt.Println(err)
 		os.Exit(1)
 	}
     */

    fmt.Println(os.Stdout, string(htmlData))

    // prints out struct fields
    fmt.Printf("\n%+v\n", jsonResponse.Message)

    // unmarshall this struct to json
    b, err := json.Marshal(jsonResponse.Message)
    if err != nil {
        fmt.Println(err)
        return
    }
    var c = jsonPrettyPrint( string(b) )
    fmt.Println(c)

}