/*
*  Objects package contains classes for our game objects. This one is for our Background, so we can have an animated background.
*/

package objects
{
	//Because we need the background asset, import Assets.
	import core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Background extends Sprite
	{
		//  We are creating two separate images for our background since it will scroll, and it will need to scroll continuously.
		//  Having two prevents a potential fringe case where the background has not jumped to the top of the screen yet.
		private var background1:Image;
		private var background2:Image;
		
		public function Background()
		{
			//  So, we instantiate our two images with the backgroundTexture in Assets.
			background1 = new Image(Assets.backgroundTexture);
			// And add them to the stage.
			addChild(background1);
			
			background2 = new Image(Assets.backgroundTexture);
			background2.y = -600; //  Since the background png is 600 pixels in the y axis, we create the second one above it.
			addChild(background2);
		}
		
		public function update():void
		{
			//  And now, in our update, we increment both backgrounds by 3 pixels every update.
			background1.y += 3;
			if(background1.y == 600) //  And if they get off the screen, they go back to the original position so that they can loop.
				background1.y = -600;
			
			background2.y += 3;
			if(background2.y == 600)
				background2.y = -600;
		}
	}
}