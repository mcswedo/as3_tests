/* 
*  Assets class manages all our assets that we are going to use in the game.
*/
package core
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	//  We will need to package our images into textures, so import starling's Texture class.
	//import starling.textures.Texture;
	
	public class Assets
	{
		//  This is how we embed an asset into Starling. This actually isn't completely working as intended. 
		//  I wanted to have assets in the root folder in a folder called assets, but it would not let me -
		//  This is instead using a folder inside root/src/core called assets.
		//[Embed(source="assets/spriteSheet.png")]
		//  We assign this embedded image to a Class - which should be named the same as the asset's name, without the extension.
		//private static var spriteSheet:Class;
		//  And then create a texture for it as well to be used in the game.
		//public static var spriteSheetTexture:Texture;
		
		// Embed the SpriteSheet XML
		[Embed(source="assets/spriteSheet.xml", mimeType="application/octet-stream")]
		private static const SpriteSheetXml:Class;
		
		// Embed the SpriteSheet Texture:
		[Embed(source="assets/spriteSheet.png")]
		private static const SpriteSheetTexture:Class;
		
		public static var pl_idle:MovieClip;
		
		[Embed(source="assets/background.png")]
		private static var background:Class;
		
		public static var backgroundTexture:Texture;
		
		public static function init():void
		{
			//  So we assign the texture a bitmap from the background Class, which is using the background.png.
			//spriteSheetTexture = Texture.fromBitmap(new spriteSheet());	
			
			// create atlas
			var texture:Texture = Texture.fromBitmap(new SpriteSheetTexture());
			var xml:XML = XML(new SpriteSheetXml());
			var spriteSheet:TextureAtlas = new TextureAtlas(texture, xml);
			
			// create movie clip
			pl_idle = new MovieClip(spriteSheet.getTextures("pl_idle_"), 6);
			pl_idle.loop = true;
			
			// the juggler is something that controls animations, and all animations need to be added to a juggler.
			// this juggler is the default, standard one included in the core Starling class.
			Starling.juggler.add(pl_idle);
			
			backgroundTexture = Texture.fromBitmap(new background());
			
			
		}
	}
}