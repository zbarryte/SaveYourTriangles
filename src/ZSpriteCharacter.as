package
{
	import org.flixel.*;
	
	public class ZSpriteCharacter extends ZSprite
	{
		private var isMovingL:Boolean;
		private var isMovingR:Boolean;
		private var isMovingU:Boolean;
		private var isMovingD:Boolean;
		
		private var speed:Number;
		private var power:Number;
		
		public function ZSpriteCharacter($speed:Number,$health:Number,$power:Number,$x:Number=0, $y:Number=0, $simpleGraphic:Class=null)
		{
			super($x, $y, $simpleGraphic);
			speed = $speed;
			health = $health;
			power = $power;
			resetState();
		}
		
		private function resetState():void {
			isMovingL = false;
			isMovingR = false;
			isMovingU = false;
			isMovingD = false;
		}
		
		public function moveL():void {isMovingL = true;}
		public function moveR():void {isMovingR = true;}
		public function moveU():void {isMovingU = true;}
		public function moveD():void {isMovingD = true;}
		
		override public function update():void {
			super.update();
			updateMovement();
			resetState();
		}
		
		protected function updateMovement():void {
			var $dx:Number = 0;
			var $dy:Number = 0;
			if (isMovingL) {$dx = -speed;}
			if (isMovingR) {$dx = speed;}
			if (isMovingU) {$dy = -speed;}
			if (isMovingD) {$dy = speed;}
			velocity = new FlxPoint($dx,$dy);
		}
	}
}