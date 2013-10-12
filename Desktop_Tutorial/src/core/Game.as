package core
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.setTimeout;
	
	//import starling.text.TextField;
	
	public class Game extends Sprite
	{
		private var player_idle_anim:MovieClip; // declaring variables for things that will be displayed so we don't have to reference Assets.(something) every time we want to edit our objects.
		private var background:Image;
	
		public function Game() //  Game's constructor is the function called by the Main class's Starling initialization.
		{
			//  Because we need to manage assets for this game, we start loading our assets right at the start.
			Assets.init();
			//  The Game constructor adds an event listener for the ADDED_TO_STAGE event, and calls the init function.
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function stopIdleAnim():void
		{
			player_idle_anim.stop();
		}
		
		private function startIdleAnim():void
		{
			player_idle_anim.play();
		}
		
		private function init(event:Event):void //  HOW FUNCTIONS ARE DECLARED - Return type goes at the very end.
		{
			player_idle_anim = Assets.pl_idle;  //  set up our references to our objects.
			background = new Image(Assets.backgroundTexture); //  we can't just add a texture to the background, so we assign it to a new Image.
			
			// addChild(new TextField(300, 300, "Hello!", "Verdana", 24)); //  HOW TO GET IT TO SAY HELLO
			
			addChild(background); //  HOW TO JUST DISPLAY AN IMAGE VIA A TEXTURE
			
			addChild(player_idle_anim); //  Adding our movie clip.
			player_idle_anim.x = 64;  //  We can change it's position,
			player_idle_anim.y = 64;
			player_idle_anim.fps = 10; //  how fast it plays,
			player_idle_anim.play();  // and just play it, too.
			
			setTimeout(stopIdleAnim, 2000);
			
			setTimeout(startIdleAnim, 4000);
		}
	}
}