package 
{
	/**
	 * ...
	 * @author Angel Hdz
	 */
	public class Settings 
	{
		
		public function Settings() 
		{
			

		}
		
		//******************************* In the Settings class
		private function loadButtons():void
		{
		//Background sound
		if(StatsMain.g_status_bgSoundON == true)
		{
		_BackgroudSoundON.visible = true;
		_BackgroudSoundOFF.visible = false;
		}
		else
		{
		_BackgroudSoundON.visible = false;
		_BackgroudSoundOFF.visible = true;
		//GameSoundManager.bgSounds_Group.mute = true;//sound is on.
		}
		}
		//Settings click. When the sound is turned off.
		private function turnOFF_BackgroundMusic():void
		{
		//OFF button is now showing
		//GameSoundManager.bgSounds_Group.mute = true;
		_BackgroudSoundOFF.visible = true;
		_BackgroudSoundON.visible = false;
		StatsMain.g_status_bgSoundON = false;
		//Sets the status of the sound
		//StatsMain.gameSharedObject.data.bgSoundisOFF = true;
		//StatsMain.gameSharedObject.data.bgSoundisON = false;
		//Save the sound setting
		StatsMain.saveSharedObject();
		trace("SceneSettings>turnOFF_BackgroundMusic(): The background sound is: " +StatsMain.g_status_bgSoundON);
		}
		
	}

}