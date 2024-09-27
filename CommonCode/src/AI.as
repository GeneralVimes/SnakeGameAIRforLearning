package 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author ...
	 */
	public class AI 
	{
		private var mySnake:Snake
		private var pauseBetweenDecisions:Number = 1;//через які проміжки часу треба приймати наступне рішення
		private var nextDecisionTime:Number = 0;//момент, коли треба прийняти наступне рішення
		private var lastTime:Number = 0;//разівник часу, з кожним кроком збільшується на пройдений час
		public function AI(sn:Snake) 
		{
			mySnake = sn;
		}
		
		public function makeStep(dt):void{
			lastTime+= dt;
			if (lastTime > nextDecisionTime){
				
				//для того, щоб 
				makeDecision(mySnake.getMyScreenRect(), mySnake.getMyFoodList())
				nextDecisionTime = lastTime+pauseBetweenDecisions;
			}
		}
		
		private function makeDecision(screenRect:Rectangle=null,foodList:Vector.<Food>=null):void{
			trace("Making a decision")
			if (foodList.length>0){
				var f:Food = foodList[0];
				
				var ax:Number = (f.x-mySnake.headX)
				var ay:Number = (f.y - mySnake.headY)
				var a:Number = Math.sqrt(ax * ax + ay * ay);
				var coef:Number = 1;
				if (a!=0){
					coef = Constants.defaultAcceleration / a;
				}
				
				mySnake.receiveAcceleration(ax*coef, ay*coef)
			}
		}
		
	}

}