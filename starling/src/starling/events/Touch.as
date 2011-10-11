// =================================================================================================
//
//	Starling Framework
//	Copyright 2011 Gamua OG. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.events
{
    import flash.geom.Matrix;
    import flash.geom.Point;
    
    import starling.display.DisplayObject;

    /** A Touch object contains information about the presence or movement of a finger 
     *  or the mouse on the screen.
     *  
     *  <p>You receive objects of this type from a TouchEvent. When such an event is triggered, you can 
     *  query it for all touches that are currently present on the screen. One Touch object contains
     *  information about a single touch. A touch object always moves through a series of
     *  TouchPhases. Have a look at the TouchPhase class for more information.</p>
     *  
     *  <strong>The position of a touch</strong>
     *  
     *  <p>You can get the current and previous position in stage coordinates with the corresponding 
     *  properties. However, you'll want to have the position in a different coordinate system 
     *  most of the time. For this reason, there are methods that convert the current and previous 
     *  touches into the local coordinate system of any object.</p>
     * 
     *  @see TouchEvent
     *  @see TouchPhase
     */  
    public class Touch
    {
        private var mID:int;
        private var mGlobalX:Number;
        private var mGlobalY:Number;
        private var mPreviousGlobalX:Number;
        private var mPreviousGlobalY:Number;
        private var mTapCount:int;
        private var mPhase:String;
        private var mTarget:DisplayObject;
        private var mTimestamp:Number;
        private var mIntent:String;
		private var mPressure:Number;
		private var mStoppedPropogating:String;
		
        /** Creates a new Touch object. */
        public function Touch(id:int, globalX:Number, globalY:Number, phase:String, target:DisplayObject)
        {
            mID = id;
            mGlobalX = mPreviousGlobalX = globalX;
            mGlobalY = mPreviousGlobalY = globalY;
            mTapCount = 0;
            mPhase = phase;
            mTarget = target;
        }
        
        /** Converts the current location of a touch to the local coordinate system of a display 
         *  object. */
        public function getLocation(space:DisplayObject):Point
        {
            var point:Point = new Point(mGlobalX, mGlobalY);
            var transformationMatrix:Matrix = mTarget.root.getTransformationMatrix(space);
            return transformationMatrix.transformPoint(point);
        }
        
        /** Converts the previous location of a touch to the local coordinate system of a display 
         *  object. */
        public function getPreviousLocation(space:DisplayObject):Point
        {
            var point:Point = new Point(mPreviousGlobalX, mPreviousGlobalY);
            var transformationMatrix:Matrix = mTarget.root.getTransformationMatrix(space);
            return transformationMatrix.transformPoint(point);
        }
        
        /** Creates a clone of the Touch object. */
        public function clone():Touch
        {
            var clone:Touch = new Touch(mID, mGlobalX, mGlobalY, mPhase, mTarget);
            clone.mPreviousGlobalX = mPreviousGlobalX;
            clone.mPreviousGlobalY = mPreviousGlobalY;
            clone.mTapCount = mTapCount;
            clone.mTimestamp = mTimestamp;
            return clone;
        }
        
        /** The identifier of a touch. '0' for mouse events, an increasing number for touches. */
        public function get id():int { return mID; }
        
        /** The x-position of the touch in stage coordinates. */
        public function get globalX():Number { return mGlobalX; }

        /** The y-position of the touch in stage coordinates. */
        public function get globalY():Number { return mGlobalY; }
        
        /** The previous x-position of the touch in stage coordinates. */
        public function get previousGlobalX():Number { return mPreviousGlobalX; }
        
        /** The previous y-position of the touch in stage coordinates. */
        public function get previousGlobalY():Number { return mPreviousGlobalY; }
        
        /** The number of taps the finger made in a short amount of time. Use this to detect 
         *  double-taps / double-clicks, etc. */ 
        public function get tapCount():int { return mTapCount; }
        
        /** The current phase the touch is in. @see TouchPhase */
        public function get phase():String { return mPhase; }
        
        /** The display object at which the touch occurred. */
        public function get target():DisplayObject { return mTarget; }
        
        /** The moment the touch occurred (in seconds since application start). */
        public function get timestamp():Number { return mTimestamp; }
        
		
		public function get pressure():Number { return mPressure;}
		public function get intent():String { return mIntent;}
		
		public function get stopped():Boolean { return mStoppedPropogating != null;}
		public function get stoppedImmediate():Boolean { return mStoppedPropogating == "immediate";}
		
		
		public function stopPropogation():void { mStoppedPropogating ||= "stopped";}
		public function stopImmediatePropogation():void { mStoppedPropogating = "immediate";}
		public function resetPropogation():void { mStoppedPropogating = null;}
        // internal methods
        
        /** @private */
        internal function setPosition(globalX:Number, globalY:Number):void
        {
            mPreviousGlobalX = mGlobalX;
            mPreviousGlobalY = mGlobalY;
            mGlobalX = globalX;
            mGlobalY = globalY;
        }
        
		/** @private */
		internal function setPhase(value:String):void { mPhase = value; }
		
		/** @private */
		internal function setIntent(value:String):void { mIntent = value; }
		
        /** @private */
        internal function setTapCount(value:int):void { mTapCount = value; }
        
        /** @private */
        internal function setTarget(value:DisplayObject):void { mTarget = value; }
        
		/** @private */
		internal function setTimestamp(value:Number):void { mTimestamp = value; }
		
		/** @private */
		internal function setPressure(value:Number):void { mPressure = value; }
		
		
		
		
		
    }
}