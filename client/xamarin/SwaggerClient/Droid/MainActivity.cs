using Android.App;
using Android.Widget;
using Android.OS;
using Android.Util;
using Newtonsoft.Json;
using IO.Swagger.Api;
using IO.Swagger.Client;
using IO.Swagger.Model;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System;
using System.Net;

namespace SwaggerClient.Droid
{
	[Activity(Label = "SwaggerClient", MainLauncher = true, Icon = "@mipmap/icon")]
	public class MainActivity : Activity
	{
		int count = 1;

		public bool MyRemoteCertificateValidationCallback(System.Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
		{
			bool isOk = true;
			// If there are errors in the certificate chain, look at each error to determine the cause.
			if (sslPolicyErrors != SslPolicyErrors.None)
			{
				for (int i = 0; i < chain.ChainStatus.Length; i++)
				{
					if (chain.ChainStatus[i].Status != X509ChainStatusFlags.RevocationStatusUnknown)
					{
						chain.ChainPolicy.RevocationFlag = X509RevocationFlag.EntireChain;
						chain.ChainPolicy.RevocationMode = X509RevocationMode.Online;
						chain.ChainPolicy.UrlRetrievalTimeout = new TimeSpan(0, 1, 0);
						chain.ChainPolicy.VerificationFlags = X509VerificationFlags.AllFlags;
						bool chainIsValid = chain.Build((X509Certificate2)certificate);
						if (!chainIsValid)
						{
							isOk = false;
						}
					}
				}
			}
			return isOk;
		}

		protected override void OnCreate(Bundle savedInstanceState)
		{
			base.OnCreate(savedInstanceState);

			System.Net.ServicePointManager.ServerCertificateValidationCallback +=
		   		delegate (object sender, System.Security.Cryptography.X509Certificates.X509Certificate certificate,
								   System.Security.Cryptography.X509Certificates.X509Chain chain,
								   System.Net.Security.SslPolicyErrors sslPolicyErrors)
		   	{
			   return true; // **** Always accept
		  	};
			ServicePointManager.ServerCertificateValidationCallback = MyRemoteCertificateValidationCallback;


			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.Main);

			// Get our button from the layout resource,
			// and attach an event to it
			Button button = FindViewById<Button>(Resource.Id.myButton);

			button.Click += delegate { 

				button.Text = string.Format("{0} calls!", count++);

				// Configure API key authorization: key
				if ( !Configuration.Default.ApiKey.ContainsKey("apikey") )
				{
					Configuration.Default.ApiKey.Add("apikey", "YOUR_API_KEY");
				}
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
					Log.Debug("SWAGGER", res);
				}
				catch (IO.Swagger.Client.ApiException e)
				{
					Log.Warn("SWAGGER", "Exception when calling DefaultApi.AlbumGetGet: " + e.Message);
				}
				catch (Exception e)
				{
					Log.Warn("SWAGGER", "Exception when calling DefaultApi.AlbumGetGet: " + e.Message);
				}
			
			};


		}
	}
}


