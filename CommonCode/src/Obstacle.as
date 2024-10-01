package 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Obstacle extends Sprite 
	{
		
		public function Obstacle() 
		{
			super();
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect( -10, -10, 20, 20);
			this.graphics.endFill();
		}
		
	}

}