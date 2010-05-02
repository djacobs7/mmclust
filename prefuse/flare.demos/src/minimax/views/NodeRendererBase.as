package minimax.views
{
	import flare.vis.data.DataSprite;
	import flare.vis.data.NodeSprite;
	import flare.vis.data.render.ShapeRenderer;
	
	import flash.text.TextField;
	
	import minimax.models.LabelData;

	public class NodeRendererBase extends ShapeRenderer
	{

		private static var _instance:NodeRendererBase = new NodeRendererBase();
		/** Static ShapeRenderer instance. */
		public static function get instance():NodeRendererBase { return _instance; }
		
		public var labelData:LabelData; 

		public function NodeRendererBase(defaultSize:Number=6)
		{
			super(defaultSize);
		}
		
		override public function render(d:DataSprite):void
		{
			var tf:TextField = new TextField();
			tf.text = labelData.getPrototypeData( (d as NodeSprite).prototypeReference ) as String;
			tf.x = -(tf.textWidth / 2);
			tf.y = -(tf.textHeight /2);
			super.render(d);
			d.addChild(tf);			
		}
	}
}