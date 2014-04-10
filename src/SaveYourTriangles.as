package
{
	import org.flixel.*;
	[SWF(width="640", height="640", backgroundColor="#000000")]
	
	public class SaveYourTriangles extends FlxGame
	{
		public function SaveYourTriangles()
		{
			super(640,640,PlayState,1,60,60);
			FlxG.debug = true;
		}
	}
}