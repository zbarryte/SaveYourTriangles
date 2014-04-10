package
{
	import org.flixel.*;
	
	public class PlayState extends ZState
	{
		private var player:Player;
		private var isPlaying:Boolean;
		private var pauseGroup:FlxGroup;
		private var wallMap:FlxTilemap;
		private var enemyGroup:FlxGroup;
		
		override public function create():void {
			addBkg();
			addPlayer();
			addPauseGroup();
			setupEnemySpawner();
			setupWallForBounding();
			resume();
		}
		private function addBkg():void {
			var $bkg:ZSprite = new ZSprite();
			$bkg.loadGraphic(Glob.kSpritinator.kBkg);
			$bkg.centerOnScreen();
			add($bkg);
			
		}
		private function addPlayer():void {
			player = new Player();
			player.attackDelegate = this;
			player.centerOnScreen();
			add(player);
		}
		private function addPauseGroup():void {
			pauseGroup = new FlxGroup();
			var $triWidth:Number = (new Triangle()).width/2;
			var $triHeight:Number = (new Triangle()).height;
			for (var i:uint = 1; i < FlxG.width/$triWidth-2; i++) {
				for (var j:uint = 1; j < FlxG.height/$triHeight-1; j++) {
					var $isPointingUp:Boolean = (i + j*$triWidth)%2 == 0;
					var $isRowEven:Boolean = j%2 == 0;
					var $triangle:Triangle = new Triangle(
						$isPointingUp,
						(i + ($isRowEven ? 1 : 0))*$triWidth,
						j*$triHeight
					);
					pauseGroup.add($triangle);
				}
			}
		}
		private function setupEnemySpawner():void {
			enemyGroup = new FlxGroup();
			add(enemyGroup);
			var $spawnFunction:Function = function():void {
				var $enemy:Enemy = new Enemy(new EnemyAIDumbHoming(player));
				// left/right
				if (Glob.maybe()) {
					if (Glob.maybe()) {$enemy.placeOffLeft();}
					else {$enemy.placeOffRight();}
					$enemy.placeRandomOnScreenY();
				}
				// up/down
				else {
					if (Glob.maybe()) {$enemy.placeOffUp();}
					else {$enemy.placeOffDown();}
					$enemy.placeRandomOnScreenX();
				}
				enemyGroup.add($enemy);
			};
			add(new ZTimer($spawnFunction,2.5,true,false));
		}
		private function setupWallForBounding():void {
			wallMap = new FlxTilemap();
			var $wallArray:Array = [1,1,1,
									1,0,1,
									1,1,1];
			var $wallCSV:String = FlxTilemap.arrayToCSV($wallArray,3);
			wallMap.loadMap($wallCSV,Glob.kSpritinator.kBarrier,FlxG.width,FlxG.height);
			wallMap.x = FlxG.width/2 - wallMap.width/2;
			wallMap.y = FlxG.height/2 - wallMap.height/2;
			add(wallMap);
		}
		
		override public function update():void {
			FlxG.collide(wallMap,player);
			if (isPlaying) {
				super.update();
				updatePlay();
			} else {
				updatePause();
			}
			
		}
		
		private function updatePlay():void {
			// pause
			if (Glob.kController.justPressed(GController.kPause)) {
				pause();
			}
			// player movement
			if (Glob.kController.pressedAfter(GController.kMoveL,GController.kMoveR)) {
				player.moveL();
			} else if (Glob.kController.pressedAfter(GController.kMoveR,GController.kMoveL)) {
				player.moveR();
			}
			if (Glob.kController.pressedAfter(GController.kMoveU,GController.kMoveD)) {
				player.moveU();
			} else if (Glob.kController.pressedAfter(GController.kMoveD,GController.kMoveU)) {
				player.moveD();
			}
			
			// playr attack
			if (Glob.kController.justPressed(GController.kAttackL)) {
				player.attackL();
			} else if (Glob.kController.justPressed(GController.kAttackR)) {
				player.attackR();
			}
			if (Glob.kController.justPressed(GController.kAttackU)) {
				player.attackU();
			} else if (Glob.kController.justPressed(GController.kAttackD)) {
				player.attackD();
			}
			
		}
		
		private function updatePause():void {
			pauseGroup.update();
			// resume
			if (Glob.kController.justPressed(GController.kPause) ||
				Glob.kController.justPressed(GController.kBack)) {
				resume();
			}
		}
		
		private function resume():void {
			isPlaying = true;
			remove(pauseGroup);
		}
		private function pause():void {
			isPlaying = false;
			add(pauseGroup);
		}
	}
}