package
{
	import TitleScreen;
	import ControlScreen;
	import InputHandler;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.utils.Color;
	
	public class Game extends Sprite //Our class Game, which is created with Starling's constructor, extends the STARLING display class Sprite;
	{
		public function Game()
		{
			super();
			//Add an event listener to our Game to be done on the Game 'Sprite' being added to the flash Stage;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		//Function takes a starling type Event, returns nothing, hence a void;
		private function init(e:Event):void
		{
			//Create the background (which is really just a colored square);
			var background:Quad = new Quad(450, 600, Color.GRAY);
			//Add the background to the stage;
			stage.addChild(background);
			
			//Create the playArea (which is just a different colored square);
			var playArea:Quad = new Quad(200, 550, Color.WHITE);
			//Change the coordinates it is displayed at (from top left corner);
			playArea.x = 25;
			playArea.y = 25;
			
			//Note that the playArea is not being added to the stage yet, order of adding things to the stage matters;
			
			//Create the border for the playArea;
			var playAreaBorder:Quad = new Quad (210, 560, Color.BLACK);
			playAreaBorder.x = 20;
			playAreaBorder.y = 20;
			
			//Add the border and the playArea to the stage, in this specific order;
			stage.addChild(playAreaBorder);
			stage.addChild(playArea);
			
			//Display the 'title screen' on the right side of the play area;
			
			var titleScreen:TitleScreen = new TitleScreen;
			titleScreen.x = 250;
			titleScreen.y = 0;
			
			stage.addChild(titleScreen);
			
			var controlScreen:ControlScreen = new ControlScreen;
			controlScreen.x = 250;
			controlScreen.y = 450;
			
			stage.addChild(controlScreen);
			
			var inputHandler:InputHandler = new InputHandler;
			stage.addChild(inputHandler);
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(KeyboardEvent.KEY_DOWN, inputHandler.onKeyDown);
		}
	}
}