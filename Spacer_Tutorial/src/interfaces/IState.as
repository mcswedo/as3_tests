/* 
*  AS3_Test2 by Michael Swedo, with tutorials found on lynda.com by Lee Brimelow.
*
*  Interfaces are essentially HEADER files - This is the only Interface that will be used. This interface is for the 
*  game states that will be used in the game, each game state class will IMPLEMENT this interface, and automatically have an
*  update and destroy method, something that is necessary for each of the game states.
*/

package interfaces
{
	public interface IState
	{
		function update():void;
		function destroy():void;
	}
}