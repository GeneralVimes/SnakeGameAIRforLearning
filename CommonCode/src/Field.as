package 
{
	import flash.display.Sprite;
	import flash.events.AccelerometerEvent;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Field extends Sprite 
	{
		private var snake:Snake;
		private var awayMarker:AwayMarker
		
		private var stageRect:Rectangle
		private var foodList:Vector.<Food>
		public function Field() 
		{
			super();
			stageRect = new Rectangle(
									0, 
									0, 
									Main.self.stage.stageWidth, 
									Main.self.stage.stageHeight
									);
			
			//просто малюємо жовтий прямокутник 800х600
			initBackground(Main.self.stage.stageWidth, Main.self.stage.stageHeight)
			
			snake = new Snake(this, true);//при створенні змійки передаємо їй поле, щоб вона знала,
			
			//де розташовувати графічні сегменти
			//створили маркер, що вказуватиме, коли змійка за екраном
			awayMarker = new AwayMarker()
			addChild(awayMarker)
			
			foodList = new Vector.<Food>()
			//for (var k:int = 0; k < 10; k++){
			//	createFood()
			//}			
		}		
		private function createFood():void 
		{//створюємо нову їжу
			var f:Food = new Food();
			f.x = stageRect.width * Math.random();
			f.y = stageRect.height * Math.random();
			addChild(f)
			foodList.push(f)
		}
		public function step(dt:Number):void{
			snake.step(dt)
			updateAwayMarkerBetter()
			//updateAwayMarker()
			
			//пробігамося по їжі та перевіряємо, чи співпадають координат голови та їжі
			for (var i:int = 0; i < foodList.length; i++){
				var f:Food = foodList[i];
				var dx:Number = f.x - snake.headX;
				var dy:Number = f.y - snake.headY;
				if (dx*dx+dy*dy<=900){
					//якщо так, їжа зникає, а змійка збільшується на 1
					f.parent.removeChild(f);//прибираємо їжу з екрану
					foodList.removeAt(i)//прибираємо їжу зі списку
					snake.createNewSegment()//збільшуємо змію
				}
			}
			
			if (foodList.length<3){
				createFood()
			}
		}
		
		private function updateAwayMarkerBetter():void 
		{
			stageRect.width = Main.self.stage.stageWidth
			stageRect.height = Main.self.stage.stageHeight
			//ідея: визначаємо обертання маркера як напрям з центра екрана на змійку
			//показуємо маркер на екрані в тій стороні, від якої ближче до змійки
			if (stageRect.contains(snake.headX, snake.headY)){
				awayMarker.visible=false
			}else{
				awayMarker.visible = true
				awayMarker.x = Math.max(0, Math.min(stageRect.width, snake.headX))
				awayMarker.y = Math.max(0, Math.min(stageRect.height, snake.headY))
				awayMarker.rotation = Math.atan2(snake.headX-stageRect.width/2,  stageRect.height/2-snake.headY)*180/Math.PI;
			}
		}
		//оновлюємо положення маркера на екрані, в залежності від положення голови змійки
		private function updateAwayMarker():void 
		{
			//якщо голова змійки на екрані, маркер взагалі не показуємо
			//якщо ж вона за екраном, то ставимо маркер на ту сторону екрана, що найближча до голови
			//та повертаємо його так, щоб він вказував на голову
			
			stageRect.width = Main.self.stage.stageWidth
			stageRect.height = Main.self.stage.stageHeight
			
			if (stageRect.contains(snake.headX, snake.headY)){
					awayMarker.visible=false
				}else{
					awayMarker.visible = true
					
					var newMarkerX:Number = 0;
					var newMarkerY:Number = 0;
					var newMarkerRot:Number = 0;
					
					//тут буде логіка визначення нових координат маркера
					var colId:int = 0;
					var rowId:int = 0;
					//визначаємо номер колонки
					if (snake.headX<0){
						colId = 0;
					}else{
						if (snake.headX > stageRect.width){
							colId = 2;
						}else{
							colId = 1;
						}
					}					
					//визначаємо номер рядка
					if (snake.headY<0){
						rowId = 0;
					}else{
						if (snake.headY > stageRect.height){
							rowId = 2;
						}else{
							rowId = 1;
						}
					}
					
					switch(3*colId+rowId){
						case 0:{//зліва-вгорі
							newMarkerX = 0;
							newMarkerY = 0;
							newMarkerRot = -45
							break;
						}
						case 1:{//зліва
							newMarkerX = 0
							newMarkerY = snake.headY
							newMarkerRot = -90
							break
						}
						case 2:{//зліва-внизу
							newMarkerX = 0
							newMarkerY = stageRect.height
							newMarkerRot = -135
							break;
						}
						case 3:{//вгорі
							newMarkerX = snake.headX
							newMarkerY = 0;
							newMarkerRot = 0;
							break;
						}
						case 5:{//внизу
							newMarkerX = snake.headX
							newMarkerY = stageRect.height;
							newMarkerRot = 180;		
							break;
						}
						case 6:{//зправа-вгорі
							newMarkerX = stageRect.width;
							newMarkerY = 0;
							newMarkerRot = 45;	
							break;
						}
						case 7:{//зправа
							newMarkerX = stageRect.width
							newMarkerY = snake.headY
							newMarkerRot = 90							
							break;
						}
						case 8:{//зправа-внизу
							newMarkerX = stageRect.width
							newMarkerY = stageRect.height
							newMarkerRot = 135		
						}
					}
					
					awayMarker.x = newMarkerX;
					awayMarker.y = newMarkerY;
					awayMarker.rotation = newMarkerRot;
				}
			
		}
		
		public function handleKeyDown(e:flash.events.KeyboardEvent):void 
		{
			switch (e.keyCode){//натискання клавіш курсора буде міняти прискорення для змійки, щоб вона рухалася плавно
				case Keyboard.UP:{
					snake.receiveAcceleration(0,-Constants.defaultAcceleration)
					break;
				}
				case Keyboard.DOWN:{
					snake.receiveAcceleration(0,Constants.defaultAcceleration)
					break;					
				}
				case Keyboard.LEFT:{
					snake.receiveAcceleration(-Constants.defaultAcceleration,0)
					break;						
				}
				case Keyboard.RIGHT:{
					snake.receiveAcceleration(Constants.defaultAcceleration,0)
					break;					
				}
			}
		}
		
		public function handleNewSize(newWidth:int, newHeight:int):void 
		{
			this.initBackground(newWidth, newHeight)			
		}
		
		public function handleAccelerometer(e:flash.events.AccelerometerEvent):void 
		{
			snake.receiveAcceleration(
					-e.accelerationX * Constants.defaultAcceleration,
					e.accelerationY * Constants.defaultAcceleration
				);
		}
		
		public function getScreenRect():Rectangle 
		{
			return stageRect.clone()
		}
		
		public function getFoodList():Vector.<Food>
		{
			return foodList.slice()
		}
		
		private function initBackground(newWidth:int, newHeight:int):void 
		{
			this.graphics.clear();
			this.graphics.beginFill(0xffff00)
			this.graphics.drawRoundRect(0, 0, newWidth, newHeight,100)
			this.graphics.endFill();			
		}
	}

}