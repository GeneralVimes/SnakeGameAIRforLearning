package 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author ...
	 */
	public class ObjectPool 
	{
		static public var pool:ObjectPool
		/*
		private var foodPool:Vector.<Food>
		private var obstaclePool:Vector.<Obstacle>
		*/
		//замість створення масивів для кожного типу вручну ми створюємо словник, у якому по ключу - класу будемо зберігати масиви об'єктв кожного класу
		private var vectorsDict:Dictionary;
		public function ObjectPool() 
		{
			//ObjectPool - це синглтон, об'єкт, що існує у єдиному екземплярі та до нього інші матимуть доступ через ObjectPool.pool
			if (pool){//при намаганні створити ще одну копію цього об'єкта з'являтиметься помилка
				throw new Error("Pool was already created!!!");
			}
			
			pool = this;
			vectorsDict = new Dictionary();
			
			//foodPool = new Vector.<Food>()
			//obstaclePool = new Vector.<Obstacle>()
		}
		
		private function getVector4Class(cls:Class):Vector.<Object>{
			var vec2Look:Vector.<Object> = null;
			if (cls in vectorsDict){
				vec2Look = vectorsDict[cls]
			}else{
				vectorsDict[cls] = new Vector.<Object>
				vec2Look = vectorsDict[cls]
			}	
			return vec2Look
		}
		
		public function getObjectFromPool(cls:Class):Object{
			var vec2Look:Vector.<Object> = getVector4Class(cls)
			//тепер ми знаємо, в якому векторі шукати
			if (vec2Look.length>0){
				return vec2Look.pop()
			}else{
				return new cls();
			}			
		}
		
		/*
		public function getFoodFromPool():Food{
			if (foodPool.length>0){
				return foodPool.pop()
			}else{
				return new Food();
			}
		}
		
		public function getObstacleFromPool():Obstacle{
			if (obstaclePool.length>0){
				return obstaclePool.pop()
			}else{
				return new Obstacle();
			}
		}*/
		
		public function returnObject2Pool(cls:Class, f:Object):void{
			//спочатку шукаємо, у який масив його треба поставити
			var vec2Look:Vector.<Object> = getVector4Class(cls)
			vec2Look.push(f)
		}
		/*
		public function returnFood2Pool(f:Food):void{
		
			foodPool.push(f)
		}
		
		public function returnObstacle2Pool(f:Obstacle):void{
			obstaclePool.push(f)
		}
		*/
	}

}