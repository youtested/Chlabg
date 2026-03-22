package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   
   public class iNumberStepper extends MovieClip
   {
      
      private var Ele:iElement;
      
      private var pIsMove:Boolean = false;
      
      private var movex:Number;
      
      private var movecnt:uint = 0;
      
      private var movesp:*;
      
      private var gomovesp:Number;
      
      private var isPass:Boolean = false;
      
      private var px:Number = 0;
      
      private var dx:Number = 0;
      
      public function iNumberStepper()
      {
         super();
      }
      
      public function Set(n:Number, e:iElement) : void
      {
         this["iNbar"].x = -34.3 * n;
         this.Ele = e;
      }
      
      public function init() : void
      {
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.md);
      }
      
      private function md(e:*) : void
      {
         addEventListener(Event.ENTER_FRAME,this.timer);
         removeEventListener(Event.ENTER_FRAME,this.traymove);
         this["iNbar"].startDrag(false,new Rectangle(-this["iNbar"].width + 25,0,this["iNbar"].width - 25,0));
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mm);
      }
      
      private function mu(e:*) : void
      {
         this["iNbar"].stopDrag();
         this.pRel();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mm);
      }
      
      private function mm(e:*) : *
      {
         ++this.movecnt;
         this.pIsMove = true;
         this.movesp = mouseX - this.movex;
         this.movex = mouseX;
      }
      
      public function pRel() : *
      {
         if(Math.abs(this.movesp) > 3 && this.movecnt >= 5)
         {
            this.gomovesp = this.movesp;
         }
         else
         {
            this.gomovesp = 0;
            this.movesp = 0;
         }
         addEventListener(Event.ENTER_FRAME,this.traymove);
         this.movecnt = 0;
         this.pIsMove = false;
      }
      
      private function timer(e:*) : *
      {
         this.dx += Math.abs(this.px - this["iNbar"].x);
         this.px = this["iNbar"].x;
         if(this.dx > 33)
         {
            root["Sounder"].gotoAndPlay("te");
            this.dx = 0;
         }
      }
      
      public function getValue() : Number
      {
         return Math.round(-this["iNbar"].x / 34.3);
      }
      
      private function traymove(e:*) : *
      {
         var xr:Number = NaN;
         var type:Number = 0;
         if(name == "q1")
         {
            type = 1;
         }
         else
         {
            type = 2;
         }
         iKnowEle.Set(this.Ele.iNm,this.getValue(),type);
         if(this["iNbar"].x < -this["iNbar"].width + 25 || this["iNbar"].x > 0)
         {
            if(this["iNbar"].x < -this["iNbar"].width + 25)
            {
               this["iNbar"].x = -this["iNbar"].width + 25;
            }
            if(this["iNbar"].x > 0)
            {
               this["iNbar"].x = 0;
            }
            this.gomovesp = 0;
            removeEventListener(Event.ENTER_FRAME,this.traymove);
         }
         else if(Math.abs(this.gomovesp) > 0.3)
         {
            this["iNbar"].x += this.gomovesp;
            if(this.gomovesp > 0)
            {
               this.gomovesp -= 0.1;
            }
            else
            {
               this.gomovesp += 0.1;
            }
         }
         else
         {
            xr = Math.abs(this["iNbar"].x + Math.round(-this["iNbar"].x / 34.3) * 34.3);
            if(xr < 34.43)
            {
               if(this["iNbar"].x < -Math.round(-this["iNbar"].x / 34.3) * 34.3 - 0.4)
               {
                  xr = (-Math.round(-this["iNbar"].x / 34.3) * 34.3 - this["iNbar"].x) / 7;
                  this["iNbar"].x += xr;
               }
               else if(this["iNbar"].x > -Math.round(-this["iNbar"].x / 34.3) * 34.3 + 0.4)
               {
                  xr = (this["iNbar"].x + Math.round(-this["iNbar"].x / 34.3) * 34.3) / 7;
                  this["iNbar"].x -= xr;
               }
               else
               {
                  removeEventListener(Event.ENTER_FRAME,this.traymove);
                  removeEventListener(Event.ENTER_FRAME,this.timer);
               }
            }
         }
      }
   }
}

