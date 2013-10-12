package core
{
	import flash.display.Sprite;
	
	import starling.core.Starling;

	[SWF(frameRate=60,width=800, height=600, backgroundColor=0x000000)] //SWF metadata. Allows us to set the framerate, width, height, etc.
	public class Main extends Sprite
	{
		public function Main()
		{
			//Declare a variable of tyle Starling that uses the Game class and the main flash stage.
			var myStarling:Starling = new Starling(Game, stage); 
			//Because seeing the framerate and things are important, we can use Starling's built in stats, displayed in top-left.
			myStarling.showStats = true;
			//Now, we go ahead and start our Starling instance, which adds the Game class to the stage, so GOTO Game.as for next.
			myStarling.start();
		}
	}
}