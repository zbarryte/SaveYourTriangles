package
{
	public class Enemy extends ZSpriteCharacter
	{
		private var AI:EnemyAI;
		
		public function Enemy($AI:EnemyAI, $x:Number=0, $y:Number=0)
		{
			super(44,10,2,$x, $y, Glob.kSpritinator.kEnemy);
			AI = $AI;
			AI.delegate = this;
		}
		
		override public function update():void {
			super.update();
			AI.update();
		}
	}
}