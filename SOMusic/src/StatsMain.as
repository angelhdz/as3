package
{
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Angel Hdz
	 */
	public class StatsMain 
	{
		
		public static var g_status_bgSoundON:Boolean;
		public static var gameSharedObject:SharedObject = SharedObject.getLocal("cookie");
		
		
		if (!gameSharedObject.data.bgSoundisON)
		{
			gameSharedObject.data.bgSoundisON = true;
			//GameSoundManager.bgSounds_Group.mute = false;
		}
		//Sound
		g_status_bgSoundON = gameSharedObject.data.bgSoundisON;

		
		
		public static function saveSharedObject():void
		{
			gameSharedObject.data.bgSoundisON = g_status_bgSoundON;
			gameSharedObject.flush ();
			trace("StatsMain: All objects have been flushed!");
			trace("StatsMain: The variable for bg sound is: " +g_status_bgSoundON);
			trace("StatsMain: The Shared Object for bg sound is: " +gameSharedObject.data.bgSoundisON);
			/*trace("STATS MAIN [START]********************************************************");
			trace("The flush statement has excuted!");
			trace("Status of the bgSoundisON: " +gameSharedObject.data.bgSoundisON);
			trace("-----------------------------------------------------------");
			trace("STATS MAIN [END]**********************************************************");*/
		}
	}
	
}