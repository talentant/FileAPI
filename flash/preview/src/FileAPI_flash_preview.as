package{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;
	
	public class FileAPI_flash_preview extends Sprite
	{
//		private const testImageBase64:String = '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';
		private var callback:String = 'callback';
		private var t:Timer = new Timer(300, 10);
		private var b:Bitmap;
		private var scaleMode:String = 'exactFit';
		
		public function FileAPI_flash_preview(){
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		//===== init
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// config stage
			stage.align = "TL";
			stage.scaleMode = 'noScale';
			stage.quality = "best";
			
			stage.addEventListener(Event.RESIZE, onStageRecize);
			
			scaleMode = loaderInfo.parameters['scale'] ? loaderInfo.parameters['scale'] : 'exactFit';
			// parse fv
			var p:String = loaderInfo.parameters['callback'];
			if (p != null && p != "") {
				callback = p;
			}
			addCallbacks();
			ready();
		}
		
		private function ready():void{
			t.addEventListener("timer", onTimer);
			t.start();
		}
		private function onTimer(e:Event):void{
			if ( callReady() )	{
				t.removeEventListener("timer", onTimer);
				t.stop();
			}
		}
		//===== js callback
		private function callReady():Boolean{
			var isReady:Boolean = false;
			try {
				var r:* = ExternalInterface.call(callback);
				isReady = ( r != null );
			}
			catch ( e:Error ) {}
			return isReady;
		}
		private function addCallbacks():void {
			ExternalInterface.addCallback('setImage', function(base64:String):void {
				t.stop();
				setImage(base64);
			});
		}
		//===== image processing
		private function setImage(base64:String):void {
			try {
				// create bitmap data
				var l:Loader = new Loader();
				l.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
					e.currentTarget.removeEventListener(e.type, arguments.callee);
					// add to stage
					b = l.contentLoaderInfo.content as Bitmap
					addChild(b);
					onStageRecize();
				});
				l.loadBytes(Base64.decode(base64));
			}
			catch (err:Error) {	}
		}
		
		private function onStageRecize(event:Event = null):void {
			if(scaleMode == 'exactFit' && b) {
				b.width = stage.stageWidth;
				b.height = stage.stageHeight;
			}
		}
	}
}