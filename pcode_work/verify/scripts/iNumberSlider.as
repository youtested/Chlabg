package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol725")]
   public class iNumberSlider extends MovieClip
   {
      
      public var btnDown:SimpleButton;
      
      public var btnUp:SimpleButton;
      
      public var txtN:TextField;
      
      public var Max:Number = 100;
      
      public var Min:Number = 0;
      
      public var N:Number = 0;
      
      public var Step:Number = 1;
      
      private var N2:Number = 0;
      
      private var isMove:Boolean = false;
      
      private var ty:Number = 0;
      
      public function iNumberSlider()
      {
         super();
         this.btnDown.addEventListener(MouseEvent.MOUSE_DOWN,this.bd);
         this.btnUp.addEventListener(MouseEvent.MOUSE_DOWN,this.bu);
         this.txtN.mouseEnabled = false;
      }
      
      public function Set(n:Number) : void
      {
         this.N = n;
         this.Show();
      }
      
      public function SetScale(min:Number, max:Number, step:Number) : void
      {
         this.Max = max;
         this.Min = min;
         this.Step = step;
      }
      
      private function Show() : void
      {
         if(this.Step == 1)
         {
            this.txtN.text = String(Math.round(this.N));
         }
         else if(this.Step == 0.1)
         {
            this.txtN.text = String(Math.round(this.N * 10) / 10);
         }
         else if(this.Step == 0.01)
         {
            this.txtN.text = String(Math.round(this.N * 100) / 100);
         }
         var evt:Event = new Event(Event.CHANGE);
         this.dispatchEvent(evt);
      }
      
      private function bu(e:*) : void
      {
         this.isMove = false;
         this.ty = mouseY;
         this.N2 = this.N;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.bu2);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.bm);
      }
      
      private function bd(e:*) : void
      {
         this.isMove = false;
         this.ty = mouseY;
         this.N2 = this.N;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.bd2);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.bm);
      }
      
      private function bu2(e:*) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.bu2);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.bm);
         if(!this.isMove)
         {
            if(this.N < this.Max)
            {
               this.N += this.Step;
            }
         }
         this.Show();
      }
      
      private function bd2(e:*) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.bd2);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.bm);
         if(!this.isMove)
         {
            if(this.N > this.Min)
            {
               this.N -= this.Step;
            }
         }
         this.Show();
      }
      
      private function bm(e:*) : void
      {
         this.isMove = true;
         var an:Number = Math.round(this.ty - mouseY) / 300 * (this.Max - this.Min);
         if(this.N2 + an >= this.Max)
         {
            this.N = this.Max;
         }
         else if(this.N2 + an <= this.Min)
         {
            this.N = this.Min;
         }
         else
         {
            this.N = this.N2 + an;
         }
         this.Show();
      }
   }
}

