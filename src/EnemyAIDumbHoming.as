package
{
	public class EnemyAIDumbHoming extends EnemyAI
	{
		private var target:ZSpriteCharacter;
		
		public function EnemyAIDumbHoming($target:ZSpriteCharacter)
		{
			super();
			target = $target;
		}
		
		override protected function updateMovement():void {
			if (delegate.isLeftOf(target)) {
				delegate.moveR();
			}
			if (delegate.isRightOf(target)) {
				delegate.moveL();
			}
			if (delegate.isAbove(target)) {
				delegate.moveD();
			}
			if (delegate.isBelow(target)) {
				delegate.moveU();
			}
		}
	}
}