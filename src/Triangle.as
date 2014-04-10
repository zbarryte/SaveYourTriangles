package
{
	import org.flixel.*;
	
	public class Triangle extends ZSprite
	{		
		public function Triangle($isPointingUp:Boolean=true,$x:Number=0, $y:Number=0)
		{
			super($x, $y, Glob.kSpritinator.kTriangle);
			if (!$isPointingUp) {
				scale = new FlxPoint(1,-1);
			}
		}
		
		
	}
}