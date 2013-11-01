package core
{
	//import flash.utils.setTimeout;
	
	//  how to import classes from other packages that you create.
	import flash.utils.getTimer;
	
	import objects.Background;
	import objects.Player;
	import managers.PlayerProjectileManager;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	//import starling.text.TextField;
	
	public class Game extends Sprite
	{
		private var player:Player; // declaring variables for things that will be displayed so we don't have to reference Assets.(something) every time we want to edit our objects.
		private var background:Background;
		private var inputHandler:InputHandler;
		private var playerProjectileManager:PlayerProjectileManager;
		private var previousFrameMillis:Number;
		
		public static var dt:Number;
		public static const WIDTH:int = 800;
		public static const HEIGHT:int = 600;
		
		public function Game() //  Game's constructor is the function called by the Main class's Starling initialization.
		{
			this.x = 0;
			this.y = 0;
			
			//  Because we need to manage assets for this game, we start loading our assets right at the start.
			//  Assets being initialized up here, as soon as possible, is VERY IMPORTANT, because everything relies on our assets being created. We can't create anything until we do this!
			Assets.init();
			//  The Game constructor adds an event listener for the ADDED_TO_STAGE event, and calls the init function.
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void //  HOW FUNCTIONS ARE DECLARED - Return type goes at the very end.
		{
			//  How to add things to the stage - Our background object is its' own class, so we create an instance of it with the new keyword.
			background = new Background();
			//  And then add it as a Child to the Game class, which will display it. The display tree is multiple-layered, you can have children of children of the game objects.
			//  This instance (child of child) will be used for movieClips (animations) - which are children of game objects, which are children of the Game.
			addChild(background);
			
			//  The inputHandler is actually a SPRITE, so yes, it too, must be added to the Game to work.
			inputHandler = new InputHandler();
			addChild(inputHandler);
			
			playerProjectileManager = new PlayerProjectileManager(this);
			//addChild(playerProjectileManager);
			
			player = new Player(inputHandler, playerProjectileManager); //  BECAUSE THIS relies on the Assets being created, it HAS to be done after the Assets are created.
			addChild(player);
			
			previousFrameMillis = getTimer();
			
			//  Add an event listener for the ENTER_FRAME event, which will call our update function.
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			var currentFrameMillis:Number = getTimer();
			dt = ((currentFrameMillis - previousFrameMillis) / 1000.0);
			previousFrameMillis = currentFrameMillis;
			
			//  In the update function, we want to call the background's update on every frame, so that the background scrolls properly.
			background.update();
			
			//  We also are going to call the player's update function, so we update the player's movement, status, etc, on every frame.
			player.update();
			
			playerProjectileManager.update();
		}
		
	}
}