package
{
	import org.flixel.*;
	
	public class ZTimer extends FlxBasic
	{
		private var period:Number;
		private var timer:Number;
		private var callback:Function;
		private var firesOnlyOnce:Boolean;
		
		public function ZTimer($callback:Function,$period:Number,$firesImmediately:Boolean=true,$firesOnlyOnce:Boolean=false)
		{
			super();
			callback = $callback;
			period = $period;
			firesOnlyOnce = $firesOnlyOnce;
			if ($firesImmediately) {fireCallback();}
			resetTimer();
		}
		private function resetTimer():void {
			timer = 0;
		}
		
		override public function update():void {
			super.update();
			timer += FlxG.elapsed;
			if (timer >= period) {
				fireCallback();
				resetTimer();
			}
		}
		private function fireCallback():void {
			callback();
			if (firesOnlyOnce) {
				kill();
			}
		}
	}
}