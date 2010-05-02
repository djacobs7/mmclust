package minimax
{
	
	import flare.vis.data.NodeSprite;
	import flare.vis.data.Tree;
	
	import minimax.views.NodeRendererBase;
	
	public class DendrogramUtil
	{
		public function DendrogramUtil()
		{
		}





		public static function dendrogram(dendrString:String):Tree
		{
			var dendrLines:Array = dendrString.split("\n");

			
			var t:Tree = new Tree();
			var currentNode:NodeSprite = t.addRoot();
			currentNode.renderer = NodeRendererBase.instance;
			
			var stack:Array = [];
			
			
			//remove new lines at end of input file:
			var idx:int = dendrLines.length - 1;
			while(true)
			{
				currentNode['reference'] = idx;
				if( (dendrLines[idx] as String).length != 0 )
				{
					break;
				}
				idx--;
			}
			
			stack.push(currentNode);
			
			while(stack.length != 0 )
			{
				currentNode = stack.pop();
				
				var currentReference:int = currentNode['reference'] as int;
				
				if ( currentReference < 0 )
				{
					//this is a strange line of code here.  it is like this because we subtracted -1 down below.
					//this could be more elegant.
					currentNode['reference'] = -currentNode['reference'] - 2;
					currentNode['dendrogramHeight'] = 0;
					currentNode.prototypeReference = currentNode['reference'];
					
					
					currentNode.renderer = NodeRendererBase.instance;
				}
				else
				{
					var lineData:Array = (dendrLines[ currentReference ] as String).split(" ");
					
				 	var leftReference:int = lineData[0];
					var rightReference:int = lineData[1];
					var dendrogramHeight:Number = lineData[2];
					var prototypeReference:int = lineData[3];
					
					currentNode['dendrogramHeight'] = dendrogramHeight;
					currentNode.prototypeReference = prototypeReference - 1;
					
					currentNode.renderer = NodeRendererBase.instance;
					
					var leftChild:NodeSprite = t.addChild( currentNode );
					leftChild['reference'] = leftReference - 1;

					var rightChild:NodeSprite = t.addChild( currentNode );
					rightChild['reference'] = rightReference -1;
					
					
					stack.push( leftChild );
					stack.push( rightChild );
				}			
			}
			
			return t;
			
		}
		
	}
}