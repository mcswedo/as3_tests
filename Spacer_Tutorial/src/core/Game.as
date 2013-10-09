/*
AS3_Test2 by Michael Swedo, with tutorials found on lynda.com by Lee Brimelow.

The Game class is our main game loop. We are now fully in Starling world, never again touching the main Flash classes.
*/
package core
{
	/*
	*  'import' is how we refer to other files in our project. We require this main Game class to be a Sprite -
	*  Starling's constructor requires this. So, we import Starling's Sprite class, referencing the starling package, which contains the
	*  display package, which contains the Sprite class.
	*/
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.GameOver;
	import states.Menu;
	import states.Play;
	
	public class Game extends Sprite
	{
		/* 
		*  Game Class is going to have a "State Machine" so that the game states can be switched between. These are declared as
		*  public, static, and constants, because they need to be visible and referenceable elsewhere, but never need to be changed,
		*  merely toggled between. These three states are our MENU, our PLAY, and our GAME_OVER states. They are written in all-caps,
		*  according to the style preferences for AS3.
		*/
		
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		public static const GAME_OVER_STATE:int = 2;
		
		//  Current state variable - of type of the Interface IState, because this way it can be any class that implements the IState interface.
		//  This way, they do not have to be referenced by their straight class name.
		private var current_state:IState;
		
		public function Game() //  Game's constructor is the function called by the Main class's Starling initialization.
		{
			//  Because we need to manage assets for this game, we start loading our assets right at the start.
			Assets.init();
			//  The Game constructor adds an event listener for the ADDED_TO_STAGE event, and calls the init function.
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void //  HOW FUNCTIONS ARE DECLARED - Return type goes at the very end.
		{
			//  The init function adds a different event listener, one listening for the ENTER_FRAME event, 
			//  for which it will call the update function.
			changeState(MENU_STATE);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function changeState(state:int):void //  Function to change the state of the game, takes an int from a const above passed in.
		{
			if(current_state != null) //  Test for the null case right from the start of this function.
			{
				current_state.destroy(); //  Before we change the state, we must make sure that the previous state is destroyed, using its destroy method.
				current_state = null; //  Then, we can make sure that the garbage collector does its job by setting the state to null before changing it.
			}
			
			//  Now that we know the current state is null, we can change to our new state using a switch/case statement.
			switch(state) //  So we use the state integer passed in as our switch statement.
			{
				case MENU_STATE: //  If the state passed in is 0, the menu state, we change the current state to the Menu state.
					current_state = new Menu(this);  //  Each of those states takes a Game class as reference, so we pass in 'this' Game class.
					break; //  And break that case.
				case PLAY_STATE:
					current_state = new Play(this);
					break;
				case GAME_OVER_STATE:
					current_state = new GameOver(this);
					break;					
			}
			
			//  And now, we need to add that state to the display list / and to the stage, so we add it as a child.
			addChild(Sprite(current_state)); //  We cast it to a Sprite instead of an Interface so that it will be added properly.
		}
		
		private function update(event:Event):void //  Our update function for our game is one line - It merely calls the update function for our current state.
		{
			current_state.update();
		}
	}
}