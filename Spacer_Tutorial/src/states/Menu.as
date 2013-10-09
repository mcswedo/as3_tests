/* 
These files are the Game State files - A Game State is a state that the game enters, such as a menu state, a play state, or a game over state.
These states need to call back to the main Game Loop, so they can change things in real-time based on input from the player and things.
*/

package states
{
	//How to import other project files. We import them as package.ClassName.
	import core.Game;
	
	import interfaces.IState;
	
	import objects.Background;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menu extends Sprite implements IState //Because this is a state, it implements the IState Interface.
	{
		//We want to add a reference to our main Game class, so we can refer back to it. So we start by making a private variable for it...
		private var game:Game;
		private var background:Background;
		
		public function Menu(game:Game) //And pass it into our Menu constructor.
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			//  We create our background and add it to the stage.
			background = new Background();
			addChild(background);
		}
		
		public function update():void
		{
			//  In our update function, which is passed into Game's update and is updated on every frame, we update our background!
			background.update();
		}
		
		public function destroy():void
		{
		}
	}
}