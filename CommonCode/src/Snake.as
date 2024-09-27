package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Snake 
	{
		private var myField:Field;
		private var headSegment:Segment;
		
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var ax:Number = 0;
		private var ay:Number = 0;
		public function Snake(field:Field) 
		{
			myField = field
			
			headSegment = new Segment()
			myField.addChild(headSegment)
			
			headSegment.x=400
			headSegment.y=300
		}		
		public function step(dt:Number):void 
		{
			headSegment.x += dt * vx
			headSegment.y += dt * vy
			vx += dt * ax
			vy += dt * ay
		}
		
		public function receiveAcceleration(newAx:Number, newAy:Number):void 
		{
			ax = newAx
			ay = newAy
		}
		
	}

}