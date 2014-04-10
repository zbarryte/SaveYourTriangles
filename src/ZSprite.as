package
{
	import org.flixel.*;
	
	public class ZSprite extends FlxSprite
	{
		public function ZSprite($x:Number=0,$y:Number=0,$simpleGraphic:Class=null)
		{
			super($x,$y,$simpleGraphic);
		}
		
		public function centerOnScreen():void {
			x = FlxG.width/2 - width/2;
			y = FlxG.height/2 - height/2;
		}
		
		public function isAbove($spr:ZSprite):Boolean {
			return y + height < $spr.y;
		}
		public function isBelow($spr:ZSprite):Boolean {
			return y > $spr.y + $spr.height;
		}
		public function isLeftOf($spr:ZSprite):Boolean {
			return x + width < $spr.x;
		}
		public function isRightOf($spr:ZSprite):Boolean {
			return x > $spr.x + $spr.width;
		}
		
		public function placeOffLeft():void {
			x = -width;
		}
		public function placeOffRight():void {
			x = FlxG.width;
		}
		public function placeOffUp():void {
			y = -height;
		}
		public function placeOffDown():void {
			y = FlxG.height;
		}
		
		public function placeRandomOnScreenY():void {
			y = Math.random()*(FlxG.height-height);
		}
		public function placeRandomOnScreenX():void {
			x = Math.random()*(FlxG.width-width);
		}
		
		public function isOnScreen():Boolean {
			return (0 <= x && x <= FlxG.width - width && 0 <= y && y <= FlxG.height - height);
		}
	}
}