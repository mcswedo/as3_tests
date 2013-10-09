/* 
*  Assets class manages all our assets that we are going to use in the game.
*/
package core
{
	//  We will need to package our images into textures, so import starling's Texture class.
	import starling.textures.Texture;

	public class Assets
	{
		//  This is how we embed an asset into Starling. This actually isn't completely working as intended. 
		//  I wanted to have assets in the root folder in a folder called assets, but it would not let me -
		//  This is instead using a folder inside root/src/core called assets.
		[Embed(source="assets/background.png")]
		//  We assign this embedded image to a Class - which should be named the same as the asset's name, without the extension.
		private static var background:Class;
		//  And then create a texture for it as well to be used in the game.
		public static var backgroundTexture:Texture;
		
		public static function init():void
		{
			//  So we assign the texture a bitmap from the background Class, which is using the background.png.
			backgroundTexture = Texture.fromBitmap(new background());	
		}
	}
}