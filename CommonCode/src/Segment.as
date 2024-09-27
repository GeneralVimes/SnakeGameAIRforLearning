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
		
		public function Segment(isBitmap:Boolean=false) 
		{
			super();//сегменти - червоні кола

			[Embed (source = "../imgs/segment.png"]
			var SegmentImage:Class;
			
			if (isBitmap){
				var im:Bitmap = new SegmentImage();
				this.addChild(im)				
			}else{
				this.graphics.beginFill(0xff0000)
				this.graphics.drawCircle(0, 0, 20)
				this.graphics.endFill()				
			}

		}
		
	}

}