package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.media.SoundChannel;
   
   public class AirBubble extends MovieClip
   {
      
      private var n:Number = 0;
      
      private var ist:Number = 0.1;
      
      private var ss:SoundChannel;
      
      public function AirBubble()
      {
         super();
      }
      
      public function Stop() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.timer);
         if(this.ss != null)
         {
            this.ss.stop();
         }
         this.n = 0;
         this.ist = 0.1;
      }
      
      public function Start() : void
      {
         if(this.n == 0)
         {
            this.ss = new mBoil1().play(0,99999);
            addEventListener(Event.ENTER_FRAME,this.timer);
            ++this.n;
            this.addBubble();
            this.addBubble();
         }
         this.ist *= 0.97;
      }
      
      private function addBubble() : void
      {
         var a:AirBubbleIn = null;
         a = new AirBubbleIn();
         a.x = Math.random() * 70 - 35;
         a.y = -Math.random() * 10;
         addChild(a);
         ++this.n;
      }
      
      private function timer(e:*) : void
      {
         if(Math.random() < this.ist)
         {
            this.addBubble();
         }
      }
   }
}

