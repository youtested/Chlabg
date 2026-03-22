package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1578")]
   public class iFml extends MovieClip
   {
      
      public var movTxt:MovieClip;
      
      private var iTime:Number = 0;
      
      private var iText:String = "";
      
      private var iFmlN:Number = 0;
      
      private var iList:Array = new Array();
      
      private var iHide:Boolean = false;
      
      private var pIsMove:Boolean = false;
      
      public var movex:*;
      
      public var cmovex:Number;
      
      private var cmovecnt:uint = 0;
      
      public var movesp:*;
      
      public var gomovesp:*;
      
      public var cmovesp:*;
      
      public var cgomovesp:Number;
      
      public function iFml()
      {
         super();
         this.movTxt.pFml.scrollV = 0;
         this.movTxt.movBar.visible = false;
         this.movTxt.pFml.autoSize = TextFieldAutoSize.CENTER;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.md);
         this.movTxt.pFml.addEventListener(Event.SCROLL,this.onScroll);
      }
      
      public function iGetFml() : String
      {
         return this.iList.toString();
      }
      
      public function iGetFmlN() : String
      {
         return String(this.iFmlN);
      }
      
      public function iLoad(t:String, n:Number) : void
      {
         var t2:String = null;
         var i:* = undefined;
         var tk:Array = t.split(",");
         for(i in tk)
         {
            t2 = root["myDb"].iGetFml(tk[i]);
            if(this.iText == "")
            {
               this.iText += t2;
            }
            else
            {
               this.iText += "\n" + t2;
            }
         }
         this.iList = tk.concat();
         this.iFmlN = Number(n);
         if(this.iFmlN >= 2 || this.iFmlN == 1 && Boolean(this.iHide))
         {
            this.movTxt.movBar.Arrow.gotoAndPlay(2);
            this.movTxt.movBar.visible = true;
         }
         this.movTxt.pFml.htmlText = this.iText;
         this.movTxt.pFml.height = this.movTxt.pFml.textHeight + 5;
         this.movTxt.pFml.cacheAsBitmap = true;
         this.movTxt.pFml.y = -this.movTxt.pFml.height + 65;
         this.movTxt.y = -122.15 - 48;
      }
      
      private function onScroll(evt:Event) : void
      {
         this.movTxt.pFml.scrollV = 0;
      }
      
      public function iClear() : void
      {
         this.iHide = false;
         this.iText = "";
         this.iFmlN = 0;
         this.movTxt.movBar.Arrow.gotoAndStop(1);
         this.movTxt.movBar.visible = false;
         this.movTxt.pFml.htmlText = "";
         this.addEventListener(Event.ENTER_FRAME,this.et3);
         this.removeEventListener(Event.ENTER_FRAME,this.et2);
      }
      
      public function iShowFml(t2:String, d:*) : void
      {
         var t:String = root["myDb"].iGetFml(t2);
         root["myLab"].myReport.NewAction(ActionType.REACTION,t,d);
         ++this.iFmlN;
         if(this.iFmlN == 2 || this.iFmlN == 1 && Boolean(this.iHide))
         {
            this.movTxt.movBar.Arrow.gotoAndPlay(2);
            this.movTxt.movBar.visible = true;
         }
         this.addEventListener(Event.ENTER_FRAME,this.et);
         this.addEventListener(Event.ENTER_FRAME,this.et2);
         this.iTime = 0;
         if(this.iText == "")
         {
            this.iText += t;
         }
         else
         {
            this.iText += "\n" + t;
         }
         this.iList.push(t2);
         this.movTxt.pFml.htmlText = this.iText;
         this.movTxt.pFml.height = this.movTxt.pFml.textHeight + 5;
         this.movTxt.pFml.cacheAsBitmap = true;
      }
      
      private function et2(e:*) : void
      {
         ++this.iTime;
         if(this.iTime > 12 * 30)
         {
            this.iTime = 0;
            this.addEventListener(Event.ENTER_FRAME,this.et3);
            this.removeEventListener(Event.ENTER_FRAME,this.et2);
         }
      }
      
      private function et(e:*) : void
      {
         var dis:Number = this.movTxt.pFml.y - (-this.movTxt.pFml.height + 64);
         var dis2:Number = this.movTxt.y + 122.15;
         if(dis2 > 0.1)
         {
            this.movTxt.y -= dis2 * 0.5;
         }
         else
         {
            this.movTxt.y = -122.15;
         }
         if(dis > 0.1)
         {
            this.movTxt.pFml.y -= dis * 0.7;
         }
         else
         {
            this.movTxt.pFml.y = -this.movTxt.pFml.height + 64;
         }
         this.movTxt.FmlBoard.y = this.movTxt.pFml.y - 5;
         this.movTxt.FmlBoard.height = this.movTxt.pFml.height + 30 - 5;
         this.movTxt.FmlMask.y = this.movTxt.FmlBoard.y;
         this.movTxt.FmlMask.height = this.movTxt.FmlBoard.height;
         this.movTxt.movBar.y = this.movTxt.pFml.height + 30 - 5 + this.movTxt.FmlBoard.y;
         if(this.movTxt.pFml.y <= -this.movTxt.pFml.height + 65 && this.movTxt.y <= -122.15)
         {
            this.iHide = true;
            if(this.iFmlN == 2 || this.iFmlN == 1 && Boolean(this.iHide))
            {
               this.movTxt.movBar.Arrow.gotoAndPlay(2);
               this.movTxt.movBar.visible = true;
            }
            this.removeEventListener(Event.ENTER_FRAME,this.et);
         }
         this.Flip();
      }
      
      private function et3(e:*) : void
      {
         var dis2:Number = this.movTxt.y + 122.15 + 48;
         if(dis2 > 0.3)
         {
            this.movTxt.y -= dis2 * 0.5;
         }
         else
         {
            this.movTxt.y = -122.15 - 48;
         }
         if(this.movTxt.y <= -122.15 - 48)
         {
            this.movTxt.y = -122.15 - 48;
            this.removeEventListener(Event.ENTER_FRAME,this.et3);
         }
         this.movTxt.FmlBoard.y = this.movTxt.pFml.y - 5;
         this.movTxt.movBar.y = this.movTxt.pFml.height + 30 - 5 + this.movTxt.FmlBoard.y;
         this.movTxt.FmlMask.y = this.movTxt.FmlBoard.y;
         this.Flip();
      }
      
      private function md(e:*) : void
      {
         this.iTime = 0;
         this.stopMove();
         this.movTxt.movBar.Arrow.gotoAndStop(1);
         this.movTxt.startDrag(false,new Rectangle(this.movTxt.x,-122.15 - 48,0,this.movTxt.pFml.height - 64 + 58));
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mm);
      }
      
      private function mm(e:*) : void
      {
         this.pMove(0);
         this.iTime = 0;
      }
      
      private function mu(e:*) : void
      {
         this.movTxt.stopDrag();
         this.pRel(0);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mu);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mm);
         this.addEventListener(Event.ENTER_FRAME,this.et2);
      }
      
      private function pMove(e:*) : *
      {
         this.pIsMove = true;
         this.movesp = mouseY - this.movex;
         this.movex = mouseY;
         this.Flip();
      }
      
      private function Flip() : void
      {
         if(this.movTxt.y >= -122.15 - 48 + this.movTxt.pFml.height - 64 + 58)
         {
            this.movTxt.movBar.Arrow.scaleY = -1;
         }
         else
         {
            this.movTxt.movBar.Arrow.scaleY = 1;
         }
      }
      
      public function pRel(e:*) : *
      {
         if(Math.abs(this.movesp) > 2)
         {
            if(this.movesp > 10)
            {
               this.gomovesp = 10;
            }
            else if(this.movesp < -10)
            {
               this.gomovesp = -10;
            }
            else
            {
               this.gomovesp = this.movesp;
            }
            addEventListener(Event.ENTER_FRAME,this.traymove);
         }
         else
         {
            this.gomovesp = 0;
            this.movesp = 0;
         }
         this.pIsMove = false;
         elex = this.movTxt.y;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.pMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.pRel);
         this.Flip();
      }
      
      public function stopMove() : void
      {
         this.gomovesp = 0;
         this.Flip();
         removeEventListener(Event.ENTER_FRAME,this.traymove);
      }
      
      private function traymove(e:*) : *
      {
         if(Math.abs(this.gomovesp) > 0.3)
         {
            if(this.gomovesp > 0)
            {
               this.movTxt.y += this.gomovesp;
               this.gomovesp -= (this.gomovesp + 1) / 10;
            }
            else if(this.gomovesp < 0)
            {
               this.movTxt.y += this.gomovesp;
               this.gomovesp -= (this.gomovesp - 1) / 10;
            }
         }
         else
         {
            this.gomovesp = 0;
            removeEventListener(Event.ENTER_FRAME,this.traymove);
         }
         if(this.movTxt.y < -122.15 - 48 || this.movTxt.y > -122.15 + this.movTxt.pFml.height - 64 + 10)
         {
            this.gomovesp = 0;
            if(this.movTxt.y > -122.15 + this.movTxt.pFml.height - 64 + 10)
            {
               this.movTxt.y = -122.15 + this.movTxt.pFml.height - 64 + 10;
            }
            else
            {
               this.movTxt.y = -122.15 - 48;
            }
            removeEventListener(Event.ENTER_FRAME,this.traymove);
         }
         elex = this.movTxt.y;
         this.Flip();
      }
   }
}

