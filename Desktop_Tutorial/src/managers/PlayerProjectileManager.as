/*
	PlayerProjectileManager.as - Class that manages projectiles for the player.
*/
package managers
{
	import core.Game;
	
	import starling.display.Sprite;
	import objects.PlayerProjectile;
	
	public class PlayerProjectileManager extends Sprite
	{	
		/*
		  We are going to have an array of projectiles that the player can use. These will either be in an 'active' or 'firing' state,
		  or an 'inactive' or 'off-screen' state. We create this array at the start of the game and use it throughout play so that
		  we do not have to constantly create/destroy projectiles. This array will have FORTY bullets, so that there can be a
		  constant stream of bullets on the screen.
		*/
		private var projectiles:Array = new Array(40);
		
		public function PlayerProjectileManager(game:Game)
		{
			for(var i:int = 0; i < projectiles.length; i++)
			{
				//  Add our projectiles to our array, and as children to the game.
				var projectile:PlayerProjectile = new PlayerProjectile();
				projectiles[i] = projectile;
				game.addChild(projectile);
			}
		}
		
		//  Update function iterates through our array and updates each projectile.
		public function update():void
		{
			for(var i:int = 0; i < projectiles.length; i++)
			{
				projectiles[i].update();
			}
		}
		
		//  Create function 'creates' a new projectile by iterating through the array and finding the first inactive projectile.
		//  It then activates this projectile, and passes the x/y coordinates it should be at into the projectile's x/y coordinates.
		public function create(x:Number, y:Number):void
		{
			for(var i:int = 0; i < projectiles.length; i++)
			{
				if(!projectiles[i].isActive)
				{
					projectiles[i].activate(x, y);
					return;
				}
			}
		}
	}
}