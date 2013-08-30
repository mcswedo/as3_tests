package
{
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;

	public class InputHandler extends Sprite
	{		
		public function InputHandler()
		{
			super();
		}
		
		public function onKeyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case 32: //Spacebar;
					onSpace();
					break;
				case 27: // ESC;
					onESC();
					break;
				case 37: //Left Arrow;
					onLeft();
					break;
				case 38: //Up Arrow;
					onUp();
					break;
				case 39: //Right Arrow;
					onRight();
					break;
				case 40: //Down Arrow;
					onDown();
					break;
			}
		}
		
		private function onSpace():void
		{
			//remove the title screen, add the gameplay screen, begin gameplay
		}
		
		private function onESC():void
		{
			//end the game
		}
		
		private function onLeft():void
		{
			
		}
		
		private function onRight():void
		{
			
		}
		
		private function onUp():void
		{
			
		}
		
		private function onDown():void
		{
			
		}
	}
}