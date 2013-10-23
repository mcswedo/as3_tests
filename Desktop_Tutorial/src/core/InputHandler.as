package core
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class InputHandler extends Sprite
	{		
		public function InputHandler()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);  //  When we add our Input Handler to the stage, we need to do a few things.
		}
		
		private function onAddedToStage():void
		{
			//  We have to specifically add these event listeners to the STAGE, not to the Starling instance. 
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown); 
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		//  Setting up our keyDown booleans. They are public because they will be referenced by other classes.
		public var isLeftArrowDown:Boolean = false;
		public var isRightArrowDown:Boolean = false;
		public var isUpArrowDown:Boolean = false;
		public var isDownArrowDown:Boolean = false;
		public var isZKeyDown:Boolean = false;
		public var isXKeyDown:Boolean = false;
		public var isESCKeyDown:Boolean = false;
		
		public function onKeyDown(event:KeyboardEvent):void
		{
			switch(event.keyCode) // Statement to determine what our input is. All AS3 KeyCodes can be found at http://www.dakmm.com/?p=272.
			{
				case 90: //Z;
					isZKeyDown = true;
					break;
				case 88: //  X;
					isXKeyDown = true;
					break;
				case 27: //  ESC;
					isESCKeyDown = true;
					break;
				case 37: //  Left Arrow;
					isLeftArrowDown = true;
					break;
				case 38: //  Up Arrow;
					isUpArrowDown = true;
					break;
				case 39: //  Right Arrow;
					isRightArrowDown = true;
					break;
				case 40: //  Down Arrow;
					isDownArrowDown = true;
					break;
			}
		}
		
		public function onKeyUp(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case 90: //Z;
					isZKeyDown = false;
					break;
				case 88: //  X;
					isXKeyDown = false;
					break;
				case 27: //  ESC;
					isESCKeyDown = false;
					break;
				case 37: //  Left Arrow;
					isLeftArrowDown = false;
					break;
				case 38: //  Up Arrow;
					isUpArrowDown = false;
					break;
				case 39: //  Right Arrow;
					isRightArrowDown = false;
					break;
				case 40: //  Down Arrow;
					isDownArrowDown = false;
					break;
			}
		}
	}
}