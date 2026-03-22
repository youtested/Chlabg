package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol207")]
   public class iWelcome extends MovieClip
   {
      
      public function iWelcome()
      {
         super();
         addFrameScript(41,this.frame42,99,this.frame100,158,this.frame159,175,this.frame176,212,this.frame213,256,this.frame257,321,this.frame322,362,this.frame363,426,this.frame427,435,this.frame436,453,this.frame454,462,this.frame463,545,this.frame546);
         stop();
         this.addEventListener(Event.ADDED_TO_STAGE,this.added);
      }
      
      private function added(e:*) : void
      {
         stage.addEventListener(TouchEvent.TOUCH_TAP,this.btnd);
      }
      
      private function btnd(e:*) : void
      {
         stage.removeEventListener(TouchEvent.TOUCH_TAP,this.btnd);
         play();
      }
      
      internal function frame42() : *
      {
         root["pPan"].iStart();
         stop();
      }
      
      internal function frame100() : *
      {
         stop();
      }
      
      internal function frame159() : *
      {
         stop();
      }
      
      internal function frame176() : *
      {
         stop();
      }
      
      internal function frame213() : *
      {
         stop();
      }
      
      internal function frame257() : *
      {
         stop();
      }
      
      internal function frame322() : *
      {
         stop();
      }
      
      internal function frame363() : *
      {
         stop();
      }
      
      internal function frame427() : *
      {
         stop();
      }
      
      internal function frame436() : *
      {
         stop();
      }
      
      internal function frame454() : *
      {
         stop();
      }
      
      internal function frame463() : *
      {
         stop();
      }
      
      internal function frame546() : *
      {
         stop();
         parent.removeChild(this);
      }
   }
}

