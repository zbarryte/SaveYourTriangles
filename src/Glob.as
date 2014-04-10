package
{
	public class Glob
	{
		public static const kSpritinator:GSpritinator = new GSpritinator();
		public static const kController:GController = new GController();
		
		public static function maybe():Boolean {
			return (Math.random() >= 0.5);
		}
	}
}