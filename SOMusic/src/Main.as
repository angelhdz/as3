package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author Angel Hdz
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../bin/on.jpg")]
		private var On:Class;
		[Embed(source = "../bin/off.jpg")]
		private var Off:Class;
		[Embed(source = "../bin/music.mp3")]
		private var Music:Class;
		private var btnOn:Sprite;
		private var btnOff:Sprite;
		private var music:Sound;


		public function Main() 
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//Define buttons
			this.btnOn = new Sprite;
			this.btnOn.addChild(new On);
			this.btnOff = new Sprite;
			this.btnOff.addChild(new Off);						
			
			//Add mouse events to buttons
			this.btnOn.addEventListener(MouseEvent.CLICK, this.onClick);
			this.btnOff.addEventListener(MouseEvent.CLICK, this.onClick);
			
			//Update data
			LocalStorage.init(this);
			LocalStorage.add("cookie1");
			trace("Music is " + LocalStorage.get("cookie1", "on"));
			this.music = new Music;
			this.update();
			LocalStorage.showOutput();
		}
		
		private function disable():void
		{
			if (this.contains(this.btnOn)) this.removeChild(this.btnOn);
			if (!this.contains(this.btnOff)) this.addChild(this.btnOff);
			SoundMixer.stopAll();
		}
		
		private function update():void
		{
			if (LocalStorage.get("cookie1", "on"))
			{
				this.enable();
			}
			else
			{
				this.disable();
			}
		}
		
		private function enable():void
		{
			if (this.contains(this.btnOff)) this.removeChild(this.btnOff);
			if (!this.contains(this.btnOn)) this.addChild(this.btnOn);
				this.music.play();
		}
		
		private function onClick($event:MouseEvent):void
		{
			if (LocalStorage.get("cookie1", "on"))
			{
				LocalStorage.set("cookie1", "on", false)
			}
			else
			{
				LocalStorage.set("cookie1", "on", true);
			}
			trace("Music is " + LocalStorage.get("cookie1", "on"));
			this.update();
		}
	}
}