package 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class Food extends Sprite 
	{
		
		public function Food() 
		{
			super();
			this.graphics.beginFill(0x008800)
			this.graphics.drawCircle(0, 0, 30)
			this.graphics.endFill()
		}
		
	}

}