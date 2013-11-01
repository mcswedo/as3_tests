/*
Player.as - Player class. 
*/

package objects
{
	import core.Assets;
	import core.Game;
	import core.InputHandler;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import managers.PlayerProjectileManager;
	
	public class Player extends Sprite
	{	
		//  Create a variable to store our current animation.
		private var currentAnimation:MovieClip;
		
		//  Create an array of all our Player's animations.
		private var anims:Array = [
			Assets.pl_idle,
			Assets.pl_move,
			Assets.pl_shoot
		];
		
		//  Our array has three elements, so instead of referencing them by index, we can set up three static variables to check them.
		//  When we want to enter our array, we use these names instead of the index, for the sake of clarity.
		public static var IDLE:int = 0;
		public static var MOVE:int = 1;
		public static var SHOOT:int = 2;
		
		private const BULLET_OFFSET_X:Number = 30;
		
		private var inputHandler:InputHandler; //  We need a reference to our InputHandler so we can move the player and shoot.
		private var projectileManager:PlayerProjectileManager;
		
		private const FAST_MOVE_SPEED:Number = 300.0; //  Storing our FAST (normal) and SLOW movement speeds, so we can toggle between.
		private const SLOW_MOVE_SPEED:Number = 150.0;
		
		private var movementSpeed:Number = FAST_MOVE_SPEED; //  movement speed, which will be multiplied by deltaTime.

		// Our player's constructor sets up our reference, our default position (near the bottom middle of the screen)
		public function Player(inputHandler:InputHandler, projectileManager:PlayerProjectileManager)
		{
			this.inputHandler = inputHandler;
			this.projectileManager = projectileManager;
			this.x = Game.WIDTH / 2 - 32;
			this.y = Game.HEIGHT - 96;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//  When our player is added to the stage, the animation it should be showing is the idle animation, so we set that here.
		private function onAddedToStage(event:Event):void
		{
			setAnim(IDLE);
		}
		
		//  Our player's update function, called in the game's update, will handle the player's movement, check if the player is shooting,
		//  and look for collisions with enemy shots.
		public function update():void
		{
			handleShooting();
			handleMovement();
		}
		
		private function handleShooting():void
		{
			//  If our player is pressing or holding the Z key (we're not limiting him by time / frames / anything - as fast as he wants to shoot, he can);
			if(inputHandler.isZKeyDown)
			{
				setAnim(SHOOT);
				projectileManager.create(x + BULLET_OFFSET_X, y); //  We create a new projectile at the player's x/y, offset to the center.
			}
		}
		
		//  handleMovement looks into our inputHandler class and takes the booleans for when keys are down, moving the player and changing its' animation.
		public function handleMovement():void
		{
			//  Handler for our multiple movement speeds. If the shift key is pressed, we move slower.
			if(inputHandler.isShiftKeyDown)
			{
				movementSpeed = SLOW_MOVE_SPEED;
			} 
			else if (!inputHandler.isShiftKeyDown)
			{
				movementSpeed = FAST_MOVE_SPEED;
			}
			
			//  Case of NO movement - When all arrow keys (and the shoot key) are NOT pressed down.
			if(!inputHandler.isDownArrowDown && !inputHandler.isUpArrowDown && !inputHandler.isLeftArrowDown && !inputHandler.isRightArrowDown && !inputHandler.isZKeyDown)
			{
				setAnim(IDLE);
			}
			
			//  Movement left, by the movement speed, making sure the player stays within the bounding box of the screen.
			if(inputHandler.isLeftArrowDown && this.x >= 0) 
			{	
				x -= movementSpeed * Game.dt;
				setAnim(MOVE);
			}
			
			//  Movement right. The Game.WIDTH - this.width check ensures that the maximum pixel the player is drawn at
			//  (since it is drawn from top left corner) never exceeds the gameplay window's right border.
			if(inputHandler.isRightArrowDown && this.x <= Game.WIDTH - this.width) 
			{
				x += movementSpeed * Game.dt;
				setAnim(MOVE);
			}
			
			if(inputHandler.isUpArrowDown && this.y >= 0) 
			{
				y -= movementSpeed * Game.dt;
				setAnim(MOVE);
			}
			
			if(inputHandler.isDownArrowDown && this.y <= Game.HEIGHT - this.height) 
			{
				y += movementSpeed * Game.dt;
				setAnim(MOVE);
			}
		}
		
		//  setAnim sets our currentAnimation, taking an integer (one of the static vars up top)
		private function setAnim(anim:int):void
		{ 
			//  Case for no change - instantly return.
			if(anims[anim] == currentAnimation) return;
			
			//  If there is a change, however, we remove the currentAnimation from the player,
			removeChild(currentAnimation);
			//  Change the current animation to the new animation, using our array of animations we set up,
			currentAnimation = anims[anim];
			//  Add it as a child,
			addChild(currentAnimation);
			//  And make sure it plays.
			currentAnimation.play();
		}
	}
}