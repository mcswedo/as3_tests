package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="450", height="600", backgroundColor="0x333333")]
	public class Main extends Sprite
	{
		//Declare our variable of type Starling;
		private var myStarling:Starling;
		
		public function Main()
		{
			//Create a new instance of the Starling core that uses the Game class as its root class, and the main flash stage to display;
			myStarling = new Starling(Game, stage);
			//Set our instance of Starling's anti aliasing to 1, this is sort of 'default' for 2-D games;
			myStarling.antiAliasing = 1;
			//Start our instance of Starling;
			myStarling.start();
		}
	}
}