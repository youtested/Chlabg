package
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.*;
   
   public class iElement4 extends iElement
   {
      
      public var Btn:MovieClip;
      
      public var ShadowCol:MovieClip;
      
      public var SubName:TextField;
      
      public var SubPt:MovieClip;
      
      public var alphabetSec:MovieClip;
      
      public var iColorPan:MovieClip;
      
      public var iNew:MovieClip;
      
      public var movBottle:MovieClip;
      
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
      
      private var iIsNew:Number = 1;
      
      private var px:Number;
      
      public function iElement4(inName:String, inMM:String, inSt:*, inLab:*, inPan:*, inCol:*, inPt:*, inAlp:*, rnm:*, nn:*)
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
         gotoAndStop(this.iSt);
         if(this.iSt != 3)
         {
            this.SubPt.gotoAndStop(this.iPt);
         }
         inName = this.NoSubLine(inName);
         this.SubName.autoSize = TextFieldAutoSize.CENTER;
         this.alphabetSec.alphabet.autoSize = TextFieldAutoSize.LEFT;
         this.alphabetSec.alphabet2.autoSize = TextFieldAutoSize.LEFT;
         this.SubName.htmlText = "<font color=\'#FFFFFF\'>" + inName + "</Font>";
         if(this.iLabs.cDm.cDbs.iSb(this.iNm) != null)
         {
            this.SubName.y -= (this.iLabs.cDm.cDbs.iSbs(this.iNm) - 1) * 10 + 10;
         }
         this.SubName.cacheAsBitmap = true;
         this.alphabetSec.movBar.scale9Grid = new Rectangle(14,-8,102.5,16.5);
         var ct_temp:ColorTransform = new ColorTransform();
         ct_temp.color = inCol;
         this.iColorPan.transform.colorTransform = ct_temp;
         this.iColorPan.alpha = inAlp;
         this.ShadowCol.transform.colorTransform = ct_temp;
         this.ShadowCol.alpha = inAlp;
         this.Btn.addEventListener(MouseEvent.MOUSE_DOWN,this.startTap_Press);
         this.iTestNew();
      }
      
      public function iDelete() : void
      {
      }
      
      public function resizeBar() : void
      {
         this.alphabetSec.movBar.width = Math.max(this.alphabetSec.alphabet.width,this.alphabetSec.alphabet2.width) + 20;
      }
      
      public function iTestNew() : void
      {
         if(this.iIsNew == 2)
         {
            this.iNew.visible = true;
            this.iEnable = false;
            alpha = 0.5;
         }
         else if(this.iPans.addedChem == this.iNm)
         {
            this.iPans.addedChem = "";
            this.movBottle.gotoAndPlay(2);
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
               else
               {
                  stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.startMove_Press);
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

