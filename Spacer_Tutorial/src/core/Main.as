/*
*  AS3_Test2 by Michael Swedo. This test uses a different coding style and uses things like Interfaces to expand my knowledge of how AS3 works.
*  This test uses the Starling framework and a tutorial found on Lynda.com by Lee Brimelow. Mr. Brimelow's tutorial is on how to create a 
*  top-down space shooter using features that Starling provides. This test follows his code nearly exactly, but will be elaborating further
*  with in-line comments.
*
*  This test will be commented in nearly EVERY LINE for the sake of instruction and clarity. 
*
*  This test relies on Flash Debugger 11.8 Projector and Adobe AIR 3.8. 
*
*  The Flash Debugger 11.8 Projector is found at http://www.adobe.com/support/flashplayer/downloads.html.
*  The Adobe AIR 3.8 Development Environment is found in the Adobe Gaming SDK, available with a free Creative Cloud account.
*
*  To setup this project, first the Flash Debugger 11.8 Projector was installed inside the Flash Builder 4.7 folder.
*  It is installed in Adobe Flash Builder 4.7 -> Player -> Mac -> 11.4.
*
*  Second, the Adobe AIR 3.8 Development Environment was installed inside the Flash Builder 4.7 folder.
*  It is placed in Adobe Flash Builder 4.7 -> plugins -> com.adobe.flash.compiler_4.7.0.349722 -> AIRSDK.
*
*  Third, the Starling src folder, found in Adobe Gaming SDK 1.2 -> Frameworks -> Starling -> Starling-Framework -> starling -> src
*  was copied from the into the project src folder, so that there would be no outside references.
*/

/*
*  PACKAGES are similar to NAMESPACES in C++. They are a way for organizing similar Classes in the project, as well as making it easier
*  to have files of the same name, in case that is required.
*  The 'core' Package includes only the initialization of our Starling interface (our Main file),
*  and the Game Loop. 
*/

package core 
{
	import flash.display.Sprite; //The only time the actual flash classes are used. The flash Sprite is required to access the main flash Stage.
	import starling.core.Starling; //Import our core Starling files (which are in our src folder, not in any outside library)
	
	[SWF(frameRate=60,width=800, height=600, backgroundColor=0x000000)] //SWF metadata. Allows us to set the framerate, width, height, etc.
	public class Main extends Sprite
	{
		public function Main()
		{
			//Declare a variable of tyle Starling that uses the Game class and the main flash stage.
			var myStarling:Starling = new Starling(Game, stage); 
			//Because seeing the framerate and things are important, we can use Starling's built in stats, displayed in top-left.
			myStarling.showStats = true;
			//Now, we go ahead and start our Starling instance, which adds the Game class to the stage, so GOTO Game.as for next.
			myStarling.start();
		}
	}
}