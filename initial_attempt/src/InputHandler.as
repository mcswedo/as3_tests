package
{
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
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
			//hide the title screen, display the gameplay screen, begin gameplay
			
			//WELL AT LEAST I KNOW INPUT IS ACTUALLY WORKING
			var poop:TextField = new TextField(250, 300, "POOP", "Verdana", 48);
			this.stage.addChild(poop);
			
			//Game.swapScreen();
			//Game.gameLoop();
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