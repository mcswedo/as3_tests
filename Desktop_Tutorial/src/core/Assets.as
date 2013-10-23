/* 
*  Assets class manages all our assets that we are going to use in the game.
*/
package core
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{	
		// Embed the SpriteSheet XML
		[Embed(source="assets/spriteSheet.xml", mimeType="application/octet-stream")]
		private static const SpriteSheetXml:Class;
		
		// Embed the SpriteSheet Texture - this is private because the texture will not be used, it will be assigned to a TextureAtlas.
		[Embed(source="assets/spriteSheet.png")]
		private static const SpriteSheetTexture:Class;
		
		//  Set up public static variables to hold the animations, as MovieClips. Public because need to be referenced in other scripts.
		public static var pl_idle:MovieClip;
		public static var pl_move:MovieClip;
		public static var pl_shoot:MovieClip;
		
		//  Embed our background.
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
			
			// To create a new MovieClip, we take the frames with the given name in the XML document, as well as a framerate.
			pl_idle = new MovieClip(spriteSheet.getTextures("pl_idle_"), 6); 
			pl_idle.loop = true;
			
			pl_move = new MovieClip(spriteSheet.getTextures("pl_move_"), 6);
			pl_move.loop = true;
			
			pl_shoot = new MovieClip(spriteSheet.getTextures("pl_shoot_"), 6);
			pl_shoot.loop = true;
			
			// the juggler is something that controls animations, and all animations need to be added to a juggler.
			// this juggler is the default, standard one included in the core Starling class.
			Starling.juggler.add(pl_idle);
			
			backgroundTexture = Texture.fromBitmap(new background());
			
			
		}
	}
}