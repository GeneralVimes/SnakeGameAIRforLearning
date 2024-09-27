package states 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class GameState 
	{
		protected var myField:Field
		public function GameState(f:Field) 
		{
			myField = f;
		}
		//стан поля буде відповідати за та, що відбувається при настиненні миші та 
		public function handleMouseDown(e:flash.events.MouseEvent):void 
		{
			
		}
		//що відбувається з плином часу
		public function performStep(dt:Number):void 
		{
			
		}
		
		public function handleKeyDown(e:flash.events.KeyboardEvent):void 
		{
			
		}
		
	}

}