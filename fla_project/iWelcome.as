package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   public class iWelcome extends MovieClip
   {
      
      public function iWelcome()
      {
         super();
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
   }
}

