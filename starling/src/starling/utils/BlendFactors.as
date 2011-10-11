package starling.utils
{
	import flash.display3D.Context3DBlendFactor;
	
	import starling.core.Starling;

	public class BlendFactors
	{
		private var _source:String;
		private var _dest:String;
		
		public static const normal:BlendFactors = new BlendFactors( Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
		public static const multiply:BlendFactors = new BlendFactors( Context3DBlendFactor.DESTINATION_COLOR, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
		public static const screen:BlendFactors = new BlendFactors( Context3DBlendFactor.ONE, Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR);
		public static const add:BlendFactors = new BlendFactors( Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE);
		
		
		public function BlendFactors(source:String, dest:String)
		{
			_source = source;
			_dest = dest;
			
		}
		
		public function apply():void {
			Starling.context.setBlendFactors(_source, _dest);
		}
		
	}
}