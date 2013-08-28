package
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialized!");
			var quad:Quad = new Quad(100, 100, 0xffffff);
			stage.addChild(quad);
		}
	}
}