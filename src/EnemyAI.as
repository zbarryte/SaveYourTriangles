package
{
	import org.flixel.*;
	
	public class EnemyAI extends FlxBasic
	{
		protected var _delegate:ZSpriteCharacter;
		
		public function EnemyAI()
		{
			super();
		}
		
		public function set delegate($delegate:ZSpriteCharacter):void {
			_delegate = $delegate;
		}
		public function get delegate():ZSpriteCharacter {return _delegate;}
		override public function update():void {
			super.update();
			updateMovement();
		}
		protected function updateMovement():void {
			FlxG.log(":: EnemyAI updateMovement should be overridden");
		}
	}
}