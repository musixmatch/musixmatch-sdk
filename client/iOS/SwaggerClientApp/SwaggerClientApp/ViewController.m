//
//  ViewController.m
//  SwaggerClientApp
//
//  Created by Loreto Parisi on 19/09/16.
//  Copyright © 2016 Musixmatch. All rights reserved.
//

#import "ViewController.h"
#import "SwaggerClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SWGConfiguration *apiConfig = [SWGConfiguration sharedConfig];
    
    // Configure API key authorization: (authentication scheme: key)
    [apiConfig setApiKey:@"YOUR_API_KEY" forApiKeyIdentifier:@"apikey"];
    // Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    //[apiConfig setApiKeyPrefix:@"Bearer" forApiKeyIdentifier:@"apikey"];
    
    
    NSString *albumId = @"14250417"; // The musiXmatch album id
    NSString *format = @"json"; // output format: json, jsonp, xml. (optional) (default to json)
    
    SWGAlbumApi *apiInstance = [[SWGAlbumApi alloc] init];
    
    //
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
