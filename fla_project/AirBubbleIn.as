package
{
   import fl.transitions.*;
   import fl.transitions.easing.*;
   import flash.display.MovieClip;
   import flash.events.*;
   
   public class AirBubbleIn extends MovieClip
   {
      
      private var tw:Tween;
      
      private var scale:Number = 0;
      
      private var xp:Number;
      
      private var yp:Number;
      
      private var ysp:Number = 0;
      
      private var flag:Boolean = false;
      
      private var ht:Number = 0;
      
      public function AirBubbleIn()
      {
         super();
         alpha = 0;
         scaleX = 0.01;
         scaleY = 0.01;
         this.scale = Math.random() * 6 + 1;
         this.xp = Math.random() - 0.5;
         this.yp = Math.random() * 2 - 1;
         addEventListener(Event.ENTER_FRAME,this.timer);
         this.tw = new Tween(this,"scaleX",None.easeNone,0.01,this.scale / 14,Math.random() + 0.2,true);
         rotation = Math.random() * 150;
         this.ht = Math.random() * 120;
      }
      
      private function timer(e:*) : void
      {
         alpha = scaleX * 2;
         if(alpha > 1)
         {
            alpha = 1;
         }
         scaleY = scaleX;
         if(!this.flag)
         {
            if(y < -80 - this.ht)
            {
               this.flag = true;
            }
            else
            {
               y -= Math.random() + this.ht / 120;
               x += Math.random() - 0.5;
            }
         }
         else
         {
            x += this.xp + Math.random() * 0.5 - 0.25;
            this.ysp += 0.01;
            y -= Math.random() + this.ht / 120;
            y += this.ysp;
         }
         if(y > 10 + Math.random() * 20)
         {
            removeEventListener(Event.ENTER_FRAME,this.timer);
            parent.removeChild(this);
         }
      }
   }
}

