package
{
   import flash.display.MovieClip;
   import flash.events.*;
   
   public class iAwg extends MovieClip
   {
      
      public var iStl:iSteelRing;
      
      public function iAwg(inStl:*)
      {
         super();
         this.iStl = inStl;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.startDrag_press);
      }
      
      private function startDrag_press(e:*) : *
      {
         this.iStl.iDoAwg(false);
         this.iStl.iStr.iLabs.iDoAwg(true);
      }
   }
}

