package states 
{
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ...
	 */
	public class PauseState extends GameState 
	{
		private var tf:TextField;
		
		public function PauseState(f:Field) 
		{
			super(f);
			
		}
		
		override public function initialize(paramsOb:Object):void 
		{
			super.initialize(paramsOb);
			tf = new TextField();
			tf.text = "PAUSED"
			myField.addChild(tf);			
		}
		
		override public function finalize():void 
		{
			super.finalize();
			myField.removeChild(tf)
		}
		override public function handleKeyDown(e:KeyboardEvent):void 
		{
			super.handleKeyDown(e);
			if (e.keyCode==Keyboard.SPACE){
				myField.startState(NormalState);
			}else{
				if (e.keyCode==Keyboard.ESCAPE){
					myField.startState(EditorState);
				}	
			}
		}		
	}

}