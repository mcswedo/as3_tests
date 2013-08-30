package
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class GameplayScreen extends Sprite
	{		
		public function GameplayScreen()
		{
			super();
			
			var rowComplete:TextField = new TextField(200, 50, "Rows Completed:", "Verdana", 20, Color.BLACK, false);
			
			rowComplete.x = 0;
			rowComplete.y = 50;
			this.addChild(rowComplete);
		}
	}
}	