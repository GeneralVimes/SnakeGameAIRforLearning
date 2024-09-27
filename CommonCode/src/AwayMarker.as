package 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class AwayMarker extends Sprite 
	{
		
		public function AwayMarker() 
		{
			super();
			this.graphics.beginFill(0x0000ff, 0.8);
			this.graphics.drawRect( -10, 0, 20, 30)
			this.graphics.endFill()
		}
		
	}

}