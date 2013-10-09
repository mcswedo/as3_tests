package
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class TitleScreen extends Sprite
	{		
		public function TitleScreen()
		{
			super();
			
			var title:TextField = new TextField(200, 50, "Tetris", "Verdana", 36, Color.BLACK, true);
			var begin:TextField = new TextField(200, 50, "Space to Begin", "Verdana", 20, Color.BLACK, false);
			
			title.x = 0;
			title.y = 50;
			
			begin.x = 0;
			begin.y = 100;
						
			this.addChild(title);
			this.addChild(begin);
		}
	}
}	