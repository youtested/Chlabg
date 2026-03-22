package
{
   import flash.display.MovieClip;
   
   public class iBase extends MovieClip
   {
      
      public var iLabs:iLab;
      
      public var iPans:iPan;
      
      public var iNumber:Number;
      
      public var iName:String;
      
      public var cDv:*;
      
      public var iType:String;
      
      public var iLife:Boolean = true;
      
      public var iIsExp:Boolean = false;
      
      public var iCap:Boolean = true;
      
      public var iLinkBox:Array;
      
      public var iLink:*;
      
      public var iFirst:Boolean = true;
      
      public var iKind:String;
      
      public var px:*;
      
      public var py:Number;
      
      public var Forb:Boolean = true;
      
      public var iGenr:* = "";
      
      public function iBase()
      {
         super();
         scaleX = scaleY = Window.getRes();
      }
   }
}

