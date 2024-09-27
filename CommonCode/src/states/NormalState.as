package states 
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ...
	 */
	public class NormalState extends GameState 
	{
		
		public function NormalState(f:Field) 
		{
			super(f);
			
		}
		override public function performStep(dt:Number):void 
		{
			super.performStep(dt);
			myField.doNormalStep(dt)
		}
		override public function handleKeyDown(e:flash.events.KeyboardEvent):void 
		{
			super.handleKeyDown(e);
			if (e.keyCode==Keyboard.SPACE){
				myField.currentState = new PauseState(myField);
			}else{
				if (e.keyCode==Keyboard.DELETE){
					myField.currentState = new CheaterState(myField);
				}
			}
		}
	}

}