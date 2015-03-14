using System;
using System.Threading;
using Nancy.Hosting.Self;
using System.Linq;

namespace NancyDemo
{
	class Program
	{
		static void Main(string[] args)
		{
			var uri = "http://localhost:8888";
			var host = new NancyHost(new Uri(uri));
			Console.WriteLine ("Starting on port 8888");
			host.Start();  // start hosting
			Console.WriteLine ("started!");
				Thread.Sleep(Timeout.Infinite);
			Console.WriteLine ("Shutting down...");
			host.Stop();  // stop hosting
			Console.WriteLine ("done");
		}
	}
}