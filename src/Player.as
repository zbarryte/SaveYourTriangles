package
{
	import org.flixel.*;
	
	public class Player extends ZSpriteCharacter
	{	
		private const kAnimIdle:String = "kAnimIdle";
		private const kAnimMove:String = "kAnimMove";
		
		public var attackDelegate:PlayState;
		
		private var isAttacking:Boolean;
		private var coolDownTimer:ZTimer;
		
		public function Player($x:Number=0,$y:Number=0)
		{
			super(88,10,5,$x,$y);
			loadGraphic(Glob.kSpritinator.kPlayer,true,false,32,32);
			addAnimation(kAnimIdle,[0,1],5,true);
			addAnimation(kAnimMove,[2,3],10,true)
		}
		
		override public function update():void {
			super.update();
			updateAnimations();
			if (coolDownTimer) {coolDownTimer.update();}
		}
		
		private function updateAnimations():void {
			if (velocity.x == 0 && velocity.y == 0) {
				play(kAnimIdle);
			} else {
				play(kAnimMove);
			}
		}
		
		override protected function updateMovement():void {
			if (isAttacking) {return;}
			super.updateMovement();
		}
		
		public function attackAtPoint($point:FlxPoint,$facing:uint):void {
			if (isAttacking) {return;}
			var $attack:Attack = new Attack();
			$attack.x = x + width/2 - $point.x - $attack.width/2;
			$attack.y = y + height/2 - $point.y - $attack.height/2;
			$attack.angle = ($facing == FlxObject.LEFT ? 270 : ($facing == FlxObject.RIGHT ? 90 : ($facing == FlxObject.UP ? 0 : 180)));
			attackDelegate.add($attack);
			// cool down
			isAttacking = true;
			velocity.x = 0;
			velocity.y = 0;
			var coolDownFunction:Function = function():void {
				isAttacking = false;
			};
			coolDownTimer = new ZTimer(coolDownFunction,0.22,false,true);
			
		}
		public function attackL():void {attackAtPoint(new FlxPoint(width,0),FlxObject.LEFT);}
		public function attackR():void {attackAtPoint(new FlxPoint(-width,0),FlxObject.RIGHT);}
		public function attackU():void {attackAtPoint(new FlxPoint(0,height),FlxObject.UP);}
		public function attackD():void {attackAtPoint(new FlxPoint(0,-height),FlxObject.DOWN);}
	}
}