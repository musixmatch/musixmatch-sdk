using System;

using UIKit;

using Newtonsoft.Json;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace SwaggerClient.iOS
{
	public partial class ViewController : UIViewController
	{
		int count = 1;

		public ViewController(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			// Code to start the Xamarin Test Cloud Agent
#if ENABLE_TEST_CLOUD
			Xamarin.Calabash.Start ();
#endif

			// Perform any additional setup after loading the view, typically from a nib.
			Button.AccessibilityIdentifier = "myButton";
			Button.TouchUpInside += delegate
			{
				var title = string.Format("{0} clicks!", count++);
				Button.SetTitle(title, UIControlState.Normal);

				// Configure API key authorization: key
				Configuration.Default.ApiKey.Add("apikey", "YOUR_API_KEY");
				// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
				// Configuration.Default.ApiKeyPrefix.Add("apikey", "Bearer");

				var apiInstance = new AlbumApi();
				var albumId = "14250417";   // string | The musiXmatch album id
				var format = "json";  // string | output format: json, jsonp, xml. (optional)  (default to json)

				try
				{
					// 
					InlineResponse200 result = apiInstance.AlbumGetGet(albumId, format);
					var res = JsonConvert.SerializeObject(result);
					Console.WriteLine(res);
				}
				catch (IO.Swagger.Client.ApiException e)
				{
					Console.WriteLine("Exception when calling DefaultApi.AlbumGetGet: " + e.Message);
				}
				catch (Exception e)
				{
					Console.WriteLine("Exception when calling DefaultApi.AlbumGetGet: " + e.Message);
				}
			};
		}

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.		
		}
	}
}
