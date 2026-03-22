package
{
   import flash.display.MovieClip;
   import flash.utils.*;
   
   public class iFire extends MovieClip
   {
      
      private var iBox:Dictionary = new Dictionary();
      
      private var iN:Number = 0;
      
      public function iFire()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function iProg() : *
      {
         var scale:* = undefined;
         if(this.iN < 30)
         {
            this.iBox["f" + this.iN] = new iFireInd();
            scale = Math.round(Math.random() * 20) / 20 + 0.9;
            this.iBox["f" + this.iN].x = Math.round(Math.random() * 8) - 4;
            this.iBox["f" + this.iN].scaleY = scale;
            this.iBox["f" + this.iN].alpha = Math.random() * 0.8 + 0.2;
            addChild(this.iBox["f" + this.iN]);
            ++this.iN;
         }
      }
   }
}

