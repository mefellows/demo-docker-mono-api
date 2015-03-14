using Nancy;
namespace NancyDemo
{
	public class HelloModule : NancyModule
	{
		public HelloModule()
		{
			Get["/"] = parameters => "Hello World";
		}
	}
}