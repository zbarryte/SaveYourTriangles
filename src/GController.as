package
{
	import org.flixel.FlxG;
	
	public class GController
	{	
		// for player
		public static const kMoveL:Array = ["A"];
		public static const kMoveR:Array = ["D"];
		public static const kMoveU:Array = ["W"];
		public static const kMoveD:Array = ["S"];
		public static const kAttackL:Array = ["LEFT"];
		public static const kAttackR:Array = ["RIGHT"];
		public static const kAttackU:Array = ["UP"];
		public static const kAttackD:Array = ["DOWN"];
		
		// pause/resume
		public static const kPause:Array = ["ESCAPE","ENTER","P"];
		
		// for menus
		public static const kSelect:Array = ["SPACE","ENTER"];
		public static const kBack:Array = ["ESCAPE"];
		public static const kL:Array = ["LEFT","A"];
		public static const kR:Array = ["RIGHT","D"];
		public static const kU:Array = ["UP","W"];
		public static const kD:Array = ["DOWN","S"];
		
		/**
		 * Checks whether or not any of the keys in the array is being pressed. Wraps <code>FlxG.keys.pressed</code>
		 * 
		 * @param	$keys		An array of keys to check
		 * 
		 * @return	Whether any of the keys is being pressed
		 */
		public function pressed($keys:Array):Boolean {
			for (var i:uint = 0; i < $keys.length; i++) {
				if (FlxG.keys.pressed($keys[i])) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * Checks whether or not any of the keys in the array were just pressed. Wraps <code>FlxG.kys.justPressed</code>
		 * 
		 * @param	$keys		An array of keys to check
		 * 
		 * @return 	Whether any of the keys were just pressed
		 */
		public function justPressed($keys:Array):Boolean {
			for (var i:uint = 0; i < $keys.length; i++) {
				if (FlxG.keys.justPressed($keys[i])) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * Checks whether or not any of the keys in the array were just released. Wraps <code>FlxG.keys.justReleased</code>
		 * 
		 * @param	$keys		An array of keys to check
		 * 
		 * @return	Whether any of the keys were just released
		 */
		public function justReleased($keys:Array):Boolean {
			for (var i:uint = 0; i <$keys.length; i++) {
				if (FlxG.keys.justReleased($keys[i])) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * Checks whether or not any of the primary keys have priority over the secondary keys. Priority is given to the key last pressed and still held.
		 * 
		 * @param	$keysPrimary		An array of primary keys
		 * @param 	$keysSecondary	An array of secondary keys
		 * 
		 * @return	Whether or not the primary keys have priority over the secondary keys.
		 */
		public function pressedAfter($keysPrimary:Array,$keysSecondary:Array):Boolean {
			return pressed($keysPrimary) && (justPressed($keysPrimary) || !pressed($keysSecondary));
		}
	}
}