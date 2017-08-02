package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Angel Hdz
	 */
	public class Window extends Sprite 
	{
		private var textField:TextField;
		
		public function Window() 
		{
			super();
			this.graphics.lineStyle(1, 0x999999);
			this.graphics.beginFill(0x222222);
			this.graphics.drawRect(0, 0, 200, 200);
			this.graphics.endFill();
			this.textField = new TextField;
			this.addChild(this.textField);
			this.textField.width = 200;
			this.textField.height = 200;
			this.textField.multiline = true;
			this.textField.wordWrap = true;
			this.textField.defaultTextFormat = new TextFormat("Verdana", 13, 0x00ff99);
		}
		
		public function write(text:String):void
		{
			this.textField.text = text;			
		}
	}
}