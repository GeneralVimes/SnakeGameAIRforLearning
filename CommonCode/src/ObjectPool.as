package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class ObjectPool 
	{
		static public var pool:ObjectPool
		
		private var foodPool:Vector.<Food>
		public function ObjectPool() 
		{
			//ObjectPool - це синглтон, об'єкт, що існує у єдиному екземплярі та до нього інші матимуть доступ через ObjectPool.pool
			if (pool){//при намаганні створити ще одну копію цього об'єкта з'являтиметься помилка
				throw new Error("Pool was already created!!!");
			}
			
			pool = this;
			foodPool = new Vector.<Food>()
		}
		
		public function getFoodFromPool():Food{
			if (foodPool.length>0){
				return foodPool.pop()
			}else{
				return new Food();
			}
		}
		
		public function returnFood2Pool(f:Food):void{
			foodPool.push(f)
		}
		
	}

}