/* 
*  AS3_Test2 by Michael Swedo, with tutorials found on lynda.com by Lee Brimelow.

*  These files are the Game State files - A Game State is a state that the game enters, such as a menu state, a play state, or a game over state.
*  These states need to call back to the main Game Loop, so they can change things in real-time based on input from the player and things.
*/

package states
{
	//  Import other project files. We import them as package.ClassName.
	import core.Game;
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameOver extends Sprite implements IState //Because this is a state, it implements the IState Interface.
	{
		//We want to add a reference to our main Game class, so we can refer back to it. So we start by making a private variable for it...
		private var game:Game;
		
		public function GameOver(game:Game) //And pass it into our Menu constructor.
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}