package
{	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class Game extends Sprite //Our class Game, which is created with Starling's constructor, extends the STARLING display class Sprite;
	{
		private var gameWindow:GameWindow;
		private var titleScreen:TitleScreen;
		private var gameplayScreen:GameplayScreen;
		private var controlScreen:ControlScreen;
		
		public var inputHandler:InputHandler;
		public function Game()
		{
			super();
			//Add an event listener to our Game to be done on the Game 'Sprite' being added to the flash Stage;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		//init function creates all the screens for the game, destroys the ADDED_TO_STAGE event, and adds the event for Keyboard Input;
		private function init(e:Event):void
		{
			//Add the game window;
			gameWindow = new GameWindow();
			stage.addChild(gameWindow);
			
			//Add the 'title screen' on the right side of the play area;
			titleScreen = new TitleScreen;
			titleScreen.x = 250;
			stage.addChild(titleScreen);
			
			//Add the gameplay screen, but hide it from view - will be changed to visible later;
			gameplayScreen = new GameplayScreen;
			gameplayScreen.x = 250;
			gameplayScreen.visible = false;
			stage.addChild(gameplayScreen);
			
			//Add the control screen;
			controlScreen = new ControlScreen;
			controlScreen.x = 250;
			controlScreen.y = 450;
			stage.addChild(controlScreen);
			
			//Initialize the input handler;
			inputHandler = new InputHandler;
			stage.addChild(inputHandler);
			
			//Remove the added_to_stage event and add the keyboard event;
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, inputHandler.onKeyDown);
		}
		
		public function swapScreen():void
		{
			if(this.titleScreen.visible == true)
			{
				this.titleScreen.visible = false;
				this.gameplayScreen.visible = true;
			}
			else if(this.gameplayScreen.visible == true)
			{
				this.titleScreen.visible = true;
				this.gameplayScreen.visible = false;
			}
		}
	}
}