package
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.utils.Color;
	
	public class GameWindow extends Sprite
	{
		private var window:Quad;
		private var gameplayArea:Quad;
		private var border:Quad;
		
		public function GameWindow()
		{
			super();
			window = new Quad(450, 600, Color.GRAY);
			
			gameplayArea = new Quad(200, 550, Color.WHITE);
			gameplayArea.x = 25;
			gameplayArea.y = 25;

			border = new Quad(210,560, Color.BLACK);
			border.x = 20;
			border.y = 20;
			
			this.addChild(window);
			this.addChild(border);
			this.addChild(gameplayArea);
		}
	}
}