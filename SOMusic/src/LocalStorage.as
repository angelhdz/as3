package 
{
	import flash.display.DisplayObjectContainer;
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Angel Hdz
	 */
	public class LocalStorage 
	{
		private static var canvas:DisplayObjectContainer;
		private static var cookies:Vector.<Object> = new Vector.<Object>();
		private static var window:Window = new Window;
		
		public static function init($canvas:DisplayObjectContainer):void
		{
			canvas = $canvas;
			window.x = canvas.stage.stageWidth - window.width;
		}
		
		/**
		 * Shows the output panel containing all the key/value pairs of all existing cookies.
		*/
		public static function showOutput():void
		{
			update();
			canvas.addChild(window);
		}
		
		private static function update():void
		{
			var str:String = "";
			for (var i:String in cookies)
			{
				str += cookies[i].name;
				for (var j:String in cookies[i].so.data)
				{
					str += "\n....Key:"+j+" Value: "+cookies[i].so.data[j];
				}
				str += "\n\n";
			}
			window.write(str);
		}
		
		/**
		 * @param $cookie A string with a name for the cookie to be added.
		 * @return void
		*/
		public static function add($cookie:String):void
		{
			cookies.push({"name": $cookie, "so": SharedObject.getLocal($cookie)});
			update();
		}
		/**
		 * @param $cookie A string with a name for the cookie.
		 * @param $key The key to search in the cookie's data.
		 * @return Object - The cookie's data searched key value.

		*/
		public static function get($cookie:String, $key:String):Object
		{
			for (var i:String in cookies) 
			{
				if ($cookie == cookies[i].name) return cookies[i].so.data[$key];
			}
			return null;
		}
		
		/**
		 * @param $cookie A string with the name of the cookie for which a new key/value pair will be added.
		 * @param $key A string of the key to be added into the cookie.
		 * @param $value A value (any type) for they key to be added into the cookie.
		 * @return void

		*/
		public static function set($cookie:String, $key:String, $value:Object):void
		{
			for (var i:String in cookies) 
			{
				if ($cookie == cookies[i].name) 
				{
					cookies[i].so.data[$key] = $value;
					cookies[i].so.flush();
					break;
				}
			}
			update();
		}
	}
}