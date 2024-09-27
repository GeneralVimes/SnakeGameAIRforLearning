package 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Field extends Sprite 
	{
		private var snake:Snake;
		
		public function Field() 
		{
			super();
			//просто малюємо жовтий прямокутник 800х600
			this.graphics.beginFill(0xffff00)
			this.graphics.drawRect(0, 0, 800, 600)
			this.graphics.endFill();
			
			snake = new Snake(this);//при створенні змійки передаємо їй поле, щоб вона знала,
			//де розташовувати графічні сегменти
			
		}
		public function step(dt:Number):void{
			snake.step(dt)
		}
		
		public function handleKeyDown(e:flash.events.KeyboardEvent):void 
		{
			switch (e.keyCode){//натискання клавіш курсора буде міняти прискорення для змійки, щоб вона рухалася плавно
				case Keyboard.UP:{
					snake.receiveAcceleration(0,-1)
					break;
				}
				case Keyboard.DOWN:{
					snake.receiveAcceleration(0,1)
					break;					
				}
				case Keyboard.LEFT:{
					snake.receiveAcceleration(-1,0)
					break;						
				}
				case Keyboard.RIGHT:{
					snake.receiveAcceleration(1,0)
					break;					
				}
			}
		}
	}

}