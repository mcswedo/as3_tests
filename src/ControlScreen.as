package
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class ControlScreen extends Sprite
	{
		public function ControlScreen()
		{
			super();
			
			var left:TextField = new TextField(200, 50, "Left = Left Arrow", "Verdana", 16, Color.BLACK, false);
			var right:TextField = new TextField(200, 50, "Right = Right Arrow", "Verdana", 16, Color.BLACK, false);
			var rotate:TextField = new TextField(200, 50, "Rotate = Up Arrow", "Verdana", 16, Color.BLACK, false);
			var quit:TextField = new TextField(200, 50, "Esc to Exit", "Verdana", 16, Color.BLACK, false);
			
			left.x = 0;
			left.y = 0;
			
			right.x = 0;
			right.y = 25;
			
			rotate.x = 0;
			rotate.y = 50;
			
			quit.x = 0;
			quit.y = 75;
			
			this.addChild(left);
			this.addChild(right);
			this.addChild(rotate);
			this.addChild(quit);
		}
	}
}