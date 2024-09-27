package states 
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ...
	 */
	public class PauseState extends GameState 
	{
		
		public function PauseState(f:Field) 
		{
			super(f);
			
		}
		override public function handleKeyDown(e:KeyboardEvent):void 
		{
			super.handleKeyDown(e);
			if (e.keyCode==Keyboard.SPACE){
				myField.currentState = new NormalState(myField);
			}else{
				if (e.keyCode==Keyboard.ESCAPE){
					myField.currentState = new EditorState(myField);
				}	
			}
		}		
	}

}