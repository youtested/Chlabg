package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.TextField;
   
   public class iElement3 extends iElement
   {
      
      public var Btn:MovieClip;
      
      public var ShadowCol:MovieClip;
      
      public var SubName:TextField;
      
      public var alphabetSec:MovieClip;
      
      public var iColorPan:MovieClip;
      
      public var iNew:MovieClip;
      
      public var movActive:MovieClip;
      
      private var _text:CurvedText;
      
      public var iEnable:Boolean = true;
      
      public var iNm:*;
      
      public var iNm2:*;
      
      public var iRNm:String;
      
      public var iSt:*;
      
      public var iPt:*;
      
      public var iAlp:*;
      
      private var iLabs:iLab;
      
      private var iPans:iPan;
      
      private var iCtn:Number;
      
      public var iIsCtn:Boolean;
      
      public var iColor:Number;
      
      private var iMp:Number;
      
      public var pos:String = "";
      
      public var mix:*;
      
      public var mixr:Array;
      
      private var inMoving:Boolean = false;
      
      private var iIsNew:Boolean = false;
      
      private var iActiveNumber:Number;
      
      private var px:Number;
      
      public function iElement3(inName:String, inMM:String, inSt:*, inLab:*, inPan:*, inCol:*, inPt:*, inAlp:*, rnm:*, nn:*)
      {
         super();
         this.iRNm = inName;
         this.iNm = rnm;
         this.iPans = inPan;
         this.iLabs = inLab;
         this.iIsNew = nn;
         this.iIsCtn = false;
         this.iCtn = 0;
         this.inMoving = false;
         this.iSt = inSt;
         this.iPt = inPt;
         this.iMp = 0;
         inName = this.NoSubLine(inName);
         this.SubName.htmlText = "<font color=\'#FFFFFF\'>" + inName + "</Font>";
         this.SubName.cacheAsBitmap = true;
         var ct_temp:ColorTransform = new ColorTransform();
         ct_temp.color = inCol;
         this.iColorPan.transform.colorTransform = ct_temp;
         this.iColorPan.alpha = inAlp;
         this.mouseEnabled = false;
         this.iColorPan.cacheAsBitmap = true;
         this.Btn.addEventListener(MouseEvent.MOUSE_DOWN,this.startTap_Press);
      }
      
      public function iActive(n:Number) : void
      {
         this.iActiveNumber = n;
         addEventListener(Event.ENTER_FRAME,this.act);
      }
      
      public function iDelete() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.act);
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function act(e:*) : void
      {
         var dx:Number = NaN;
         if(parent != null)
         {
            if(parent.parent != null)
            {
               dx = x + parent.x + parent.parent.x;
               if(dx > 20 && dx < 1000)
               {
                  this.movActive.gotoAndPlay("Con" + String(this.iActiveNumber));
                  removeEventListener(Event.ENTER_FRAME,this.act);
               }
            }
         }
      }
      
      public function iTestNew() : void
      {
         if(this.iIsNew)
         {
            this.iNew.visible = true;
         }
      }
      
      private function NoSubLine(t:String) : String
      {
         var nt:String = "";
         for(var s:* = 0; s < t.length; s++)
         {
            if(t.charAt(s) != "_")
            {
               nt += t.charAt(s);
            }
         }
         return nt;
      }
      
      public function startTap_Press(e:*) : void
      {
         root["pPan"].stopMove();
         this.px = mouseX;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopMove_Press);
      }
      
      private function startMove_Press(e:*) : void
      {
         ++this.iMp;
         var dx:Number = Math.abs(this.px - mouseX);
         if(dx < 50)
         {
            if(mouseY > 20 && !this.inMoving)
            {
               if(this.iEnable)
               {
                  this.iDrag();
               }
            }
         }
         else if(!this.inMoving)
         {
            root["pPan"].pDrag(0);
            this.inMoving = true;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         }
      }
      
      public function stopMove_Press(e:*) : void
      {
         this.inMoving = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopMove_Press);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         if(this.iMp == 0)
         {
            this.iTap();
         }
         this.iMp = 0;
      }
      
      public function iDrag() : void
      {
         root["pPan"].movesp = 0;
         root["pPan"].pRel(0);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopMove_Press);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
         if(root["pPan"].iCreator.currentFrame == 3)
         {
            root["pPan"].iCreator.movNote.gotoAndStop(1);
         }
         root["pPan"].cCreateTap(this);
         root["pPan"].msdPickUp.play();
      }
      
      public function iTap() : *
      {
         if(this.iSt < 5)
         {
            root["pPan"].showDetail(this.iRNm,this,this.iNm);
         }
      }
   }
}

