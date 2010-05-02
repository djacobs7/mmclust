package minimax.models
{
	public class LabelData
	{
		private var _data:Object = {};
		
		public function LabelData()
		{
		}
		
		public function setDataFromTxt(value:String):void
		{
			var lines:Array = value.split("\n");
			for each(var line:String in lines)
			{
				var lineData:Array = line.split(" ");
				
				var prototypeReference:String = lineData[0];
				var prototypeData:String = lineData[1];
				
				_data[parseInt(prototypeReference) - 1] = prototypeData;
			}
		}
		
		
		public function getPrototypeData( key:int ):Object
		{
			return _data[key];
		}		
	}
}