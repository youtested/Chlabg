package
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.*;
   
   public class iBtnCo extends MovieClip
   {
      
      private var iStage:Stage;
      
      public function iBtnCo()
      {
         super();
         this.iStage = stage;
         addEventListener(MouseEvent.MOUSE_DOWN,this.md);
      }
      
      private function md(e:*) : void
      {
         gotoAndStop(2);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
      }
      
      private function mu(e:*) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mu);
         gotoAndPlay(3);
      }
   }
}

