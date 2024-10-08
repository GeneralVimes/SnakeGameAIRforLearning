package 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author ...
	 */
	public class Snake 
	{
		private var myField:Field;
		private var headSegment:Segment;
		
		private var segments:Vector.<Segment>//список всіх сегментів, типізований масив
		
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var ax:Number = 0;
		private var ay:Number = 0;
		private var myAI:AI;
		private var myBitmapSegmentMode:Boolean;
		public function Snake(field:Field, isBitmapView:Boolean, hasAI:Boolean=true) //isBitmapView - чи з растровими сегментами зщ файлу чи з векторними кругами 
		//hasAI - чи буде у змійки ШІ
		{
			myField = field
			myBitmapSegmentMode = isBitmapView
			
			if (hasAI){
				this.createAI()
			}	
			
			headSegment = new Segment(myBitmapSegmentMode)
			myField.addChild(headSegment)
			
			headSegment.x=400
			headSegment.y = 300
			
			segments = new Vector.<Segment>()
			segments.push(headSegment)//додаємо голову до списку сегментів
			
			for (var i:int = 0; i < Constants.numStartingSegments; i++){//створимо ще 3 сегменти
				this.createNewSegment()
			}
		}
		
		public function createNewSegment():void 
		{
			//створити новий сегмент
			var s:Segment = new Segment(myBitmapSegmentMode)
			s.x = this.segments[segments.length-1].x
			s.y = this.segments[segments.length-1].y
			//додати його на myField
			this.myField.addChild(s)
			//додати його у список сегментів
			this.segments.push(s)
		}
		
		public function step(dt:Number):void 
		{
			headSegment.x += dt * vx
			headSegment.y += dt * vy
			vx += dt * ax
			vy += dt * ay
			
			vx = Math.max( -Constants.maxSpeed, Math.min(Constants.maxSpeed, vx));
			vy = Math.max( -Constants.maxSpeed, Math.min(Constants.maxSpeed, vy));

			
			for (var i:int = 1; i < segments.length; i++){
				var s0:Segment = segments[i-1]
				var s1:Segment = segments[i]
				
				var dx:Number = s0.x - s1.x;
				var dy:Number = s0.y - s1.y;
				
				var d:Number = Math.sqrt(dx * dx + dy * dy)
				
				var coef:Number = 1
				if (d>50){
					coef = 50 / d;
				}
				
				s1.x = s0.x-dx*coef
				s1.y = s0.y-dy*coef
			}
			
			if (myAI){
				myAI.makeStep(dt)
			}
		}
		
		public function receiveAcceleration(newAx:Number, newAy:Number):void 
		{
			ax = newAx
			ay = newAy
		}
		
		private function createAI():void 
		{
			myAI = new AI(this)
		}
		
		public function getMyScreenRect():Rectangle 
		{
			return myField.getScreenRect()
		}
		
		public function getMyFoodList():Vector.<Food>
		{
			return myField.getFoodList()
		}
		//для отримання координат голови робимо геттери
		public function get headX():Number{
			return headSegment.x
		}
		public function get headY():Number{
			return headSegment.y
		}
		
	}

}