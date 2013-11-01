/* 
  PlayerProjectile.as - Class for the object of the projectile fired by the player.
*/
package objects
{
	import starling.events.Event;
	
	import core.Assets;
	import core.Game;
	
	import starling.display.Sprite;
	import starling.display.Image;
	
	public class PlayerProjectile extends Sprite
	{
		private const SPEED:Number = 600.0;	//  Speed of our projectile. Will be multiplied by deltaTime.
		private var texture:Image; //  Our projectile's texture, which is an image.
		
		public var isActive:Boolean; //  Our active boolean, which determines if a projectile is being fired or not.
		
		public function PlayerProjectile()
		{
			//  instantiate our projectiles inactive and not visible, but with a texture from our Assets class.
			isActive = false;
			visible = false;
			texture = new Image(Assets.playerProjectileTexture);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			//  When it is added to the stage, it also gets its texture added.
			addChild(texture);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		//  Update takes every active projectile and moves it upward by SPEED * deltaTime. If its' coordinates are off-screen, deactivate it.
		public function update():void
		{
			if(isActive == true)
			{
				y -= SPEED * Game.dt;
			
				if(y < 0)
				{
					deactivate();
				}
			}
		}
		
		//  Activation changes the x/y position of the projectile to the values passed in, and also makes the projectile visible.
		public function activate(x:Number, y:Number):void
		{
			isActive = true;
			this.x = x;
			this.y = y;
			visible = true;
		}
		
		//  Deactivation makes a projectile invisible again.
		private function deactivate():void
		{
			isActive = false;
			visible = false;
		}
	}
}