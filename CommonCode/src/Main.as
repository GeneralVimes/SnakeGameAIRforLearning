package
{

	import com.junkbyte.console.Cc;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Alexey Izvalov aka Airapport
	 */
	public class Main extends Sprite 
	{	
		private var field:Field;
		public static var self:Main;
		
		public var config:MainConfig;
		public function Main()
		{			
			self = this;
			config = new MainConfig();
			
			if (config.isConsoleShowing){
				showConsole();
			}
			
			Cc.log('starting...');			
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			field = new Field()
			addChild(field)
			
			stage.addEventListener(Event.ENTER_FRAME, onFrame)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown)
			stage.addEventListener(Event.RESIZE, onResize);
			
			var acc:Accelerometer = new Accelerometer()
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccelerometerUpdate);
		}
		
		private function onAccelerometerUpdate(e:AccelerometerEvent):void 
		{
			field.handleAccelerometer(e)
		}
		
		private function onResize(e:Event):void 
		{
			field.handleNewSize(stage.stageWidth, stage.stageHeight)
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			field.handleKeyDown(e)
		}
		//що відбувається кожен кадр
		private function onFrame(e:Event):void 
		{
			//поле має зреагувати на плин часу
			field.step(0.03)
		}

		
		public function buidCapabilitiesString():String 
		{
			var str:String = "";
			str += " OS: " + Capabilities.os;
			str += " cpuAddressSize: " + Capabilities.cpuAddressSize;
			str += " cpuArchitecture: " + Capabilities.cpuArchitecture;
			str += " manufacturer: " + Capabilities.manufacturer;
			str += " pixelAspectRatio: " + Capabilities.pixelAspectRatio.toString();
			str += " playerType: " + Capabilities.playerType;
			str += " screenDPI: " + Capabilities.screenDPI;
			str += " screenResX: " + Capabilities.screenResolutionX;
			str += " screenResY: " + Capabilities.screenResolutionY;
			str += " screenColor: " + Capabilities.screenColor;
			str += " supports32BitProcesses: " + Capabilities.supports32BitProcesses;
			str += " supports64BitProcesses: " + Capabilities.supports64BitProcesses;
			str += " version: " + Capabilities.version;		
			
			str += "\nStage width: " + stage.stageWidth;
			str += " stage height: " + stage.stageHeight;
			str += " full screen width: " + stage.fullScreenWidth;
			str += " full screen height: " + stage.fullScreenHeight;
			
			return str;
		}
		
		public function showConsole():void 
		{
			Cc.config.style.menuFontSize = 24;
			Cc.config.style.traceFontSize = 22;
			Cc.startOnStage(this);
			
			Cc.listenUncaughtErrors(this.loaderInfo);							
			
			Cc.visible = true;
			Cc.log(buidCapabilitiesString());
		}
		
		public function hideConsole():void{
			Cc.visible = false;
		}
	}
}