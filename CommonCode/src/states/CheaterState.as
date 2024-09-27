package states 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ...
	 */
	public class CheaterState extends GameState 
	{
		
		public function CheaterState(f:Field) 
		{
			super(f);
			
		}
		override public function performStep(dt:Number):void 
		{
			super.performStep(dt);
			myField.doNormalStep(dt)
		}
		override public function handleMouseDown(e:flash.events.MouseEvent):void 
		{
			super.handleMouseDown(e);
			myField.toggleFoodAt(e.stageX, e.stageY, e.target as Food)
		}
		override public function handleKeyDown(e:flash.events.KeyboardEvent):void 
		{
			super.handleKeyDown(e);
			if (!myField.handleSnakeAccelerationKeys(e)){
				if (e.keyCode==Keyboard.DELETE){
					myField.startState(NormalState)
				}				
			}

		}
	}

}