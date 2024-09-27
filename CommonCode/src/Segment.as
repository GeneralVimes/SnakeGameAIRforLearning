package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Segment extends Sprite 
	{
		
		public function Segment() 
		{
			super();//сегменти - червоні кола
			//this.graphics.beginFill(0xff0000)
			//this.graphics.drawCircle(0, 0, 20)
			//this.graphics.endFill()
			[Embed (source = "../imgs/segment.png"]
			var SegmentImage:Class;
			
			var im:Bitmap = new SegmentImage();
			this.addChild(im)
		}
		
	}

}