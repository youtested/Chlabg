package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2141")]
   public class iAms extends MovieClip
   {
      
      public var backs:MovieClip;
      
      public var iSnap:MovieClip;
      
      public var txtAmount:TextField;
      
      public var txtAmount1:TextField;
      
      public var txtGroup:MovieClip;
      
      public var iDv:iDevice;
      
      private var iIsDraw:Boolean;
      
      public var iN:Number = 0;
      
      private var iTime:Number = 0;
      
      public function iAms()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function iMagn() : *
      {
      }
      
      public function iClose() : void
      {
         this.visible = false;
         removeEventListener(Event.ENTER_FRAME,this.domag);
         this.iN = 0;
      }
      
      public function iSet(inM:*) : *
      {
         this.iDv = inM;
         x = inM.x;
         y = inM.y;
      }
      
      public function iStart(n:Number) : *
      {
         this.iN = n;
         this.visible = true;
         gotoAndStop(n);
      }
      
      public function iMag() : *
      {
         this.iTime = 0;
         addEventListener(Event.ENTER_FRAME,this.domag);
      }
      
      public function domag(e:*) : *
      {
         this.txtAmount.text = String(Math.round(this.iDv.cDv.cMt.cGetTotalMVol() * 10) / 10);
         this.txtAmount1.text = "mL";
         y = this.iDv.y - this.iDv.iHt;
         ++this.iTime;
         if(this.iTime > 90)
         {
            this.iTime = 0;
            this.iClose();
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

