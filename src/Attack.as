package
{
	public class Attack extends ZSprite
	{
		private var killTimer:ZTimer;
		
		public function Attack($x:Number=0, $y:Number=0)
		{
			super($x, $y,Glob.kSpritinator.kSwipe);
			
			killTimer = new ZTimer(kill,0.11,false,true);
		}
		
		override public function update():void {
			super.update();
			killTimer.update();
		}
	}
}