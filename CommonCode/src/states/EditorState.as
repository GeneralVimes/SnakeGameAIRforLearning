package states 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ...
	 */
	public class EditorState extends GameState 
	{
		
		public function EditorState(f:Field) 
		{
			super(f);
			
		}
		override public function handleKeyDown(e:KeyboardEvent):void 
		{
			super.handleKeyDown(e);
			if (e.keyCode==Keyboard.ESCAPE){
				myField.startState(NormalState);
			}	
		}	
		
		override public function handleMouseDown(e:flash.events.MouseEvent):void 
		{
			super.handleMouseDown(e);
			myField.toggleFoodAt(e.stageX, e.stageY, e.target as Food)
		}
	}

}