package flash.text
{
   public dynamic class StageText
   {
      public var text:String = "";
      public var visible:Boolean = true;
      public var editable:Boolean = true;
      public var fontFamily:String = "Arial";
      public var fontSize:Number = 12;
      public var color:uint = 0;
      public var textAlign:String = "left";
      public var autoCapitalize:String = "none";
      public var maxChars:int = 0;
      public var returnKeyLabel:String = "default";
      public var autoCorrect:Boolean = true;
      public var locale:String = "en-US";
      public var stage:*;
      public var viewPort:*;
      
      public function StageText() {}
      
      public function assignFocus():void {}
   }
}
