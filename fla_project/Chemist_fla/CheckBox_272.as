package Chemist_fla
{
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public dynamic class CheckBox_272 extends MovieClip
   {
      
      public var movBall:MovieClip;
      
      public var movBoard:MovieClip;
      
      public var isMove:Boolean;
      
      public var _selected:Boolean;
      
      public function CheckBox_272()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(sel:Boolean) : void
      {
         this._selected = sel;
         this.Set();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function md(e:*) : void
      {
         this.movBall.gotoAndStop(2);
         this.isMove = false;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mm);
         this.movBall.startDrag(false,new Rectangle(0,0,60,0));
      }
      
      public function mm(e:*) : void
      {
         this.movBoard.x = this.movBall.x;
         this.isMove = true;
      }
      
      public function mu(e:*) : void
      {
         this.movBall.stopDrag();
         this.movBall.gotoAndStop(1);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mm);
         if(!this.isMove)
         {
            addEventListener(Event.ENTER_FRAME,this.timer2);
            removeEventListener(Event.ENTER_FRAME,this.timer);
         }
         else
         {
            addEventListener(Event.ENTER_FRAME,this.timer);
         }
      }
      
      public function timer(e:*) : void
      {
         var sp:Number = NaN;
         if(this.movBall.x < 29)
         {
            sp = (this.movBall.x + 4) / 4;
            if(this.movBall.x - sp < 0)
            {
               this.movBall.x = 0;
               this._selected = false;
               dispatchEvent(new Event(Event.CHANGE));
               removeEventListener(Event.ENTER_FRAME,this.timer);
            }
            else
            {
               this.movBall.x -= sp;
            }
         }
         else
         {
            sp = (62 - this.movBall.x) / 4;
            if(this.movBall.x + sp > 58)
            {
               this.movBall.x = 58;
               this._selected = true;
               dispatchEvent(new Event(Event.CHANGE));
               removeEventListener(Event.ENTER_FRAME,this.timer);
            }
            else
            {
               this.movBall.x += sp;
            }
         }
         this.movBoard.x = this.movBall.x;
      }
      
      public function Set() : void
      {
         if(this._selected)
         {
            this.movBall.x = 58;
            this.movBoard.x = 58;
         }
         else
         {
            this.movBall.x = 0;
            this.movBoard.x = 0;
         }
      }
      
      public function timer2(e:*) : void
      {
         var sp:Number = NaN;
         if(this._selected)
         {
            sp = (this.movBall.x + 4) / 4;
            if(this.movBall.x - sp < 0)
            {
               this.movBall.x = 0;
               this._selected = false;
               dispatchEvent(new Event(Event.CHANGE));
               removeEventListener(Event.ENTER_FRAME,this.timer2);
            }
            else
            {
               this.movBall.x -= sp;
            }
         }
         else
         {
            sp = (62 - this.movBall.x) / 4;
            if(this.movBall.x + sp > 58)
            {
               this.movBall.x = 58;
               this._selected = true;
               dispatchEvent(new Event(Event.CHANGE));
               removeEventListener(Event.ENTER_FRAME,this.timer2);
            }
            else
            {
               this.movBall.x += sp;
            }
         }
         this.movBoard.x = this.movBall.x;
      }
   }
}

